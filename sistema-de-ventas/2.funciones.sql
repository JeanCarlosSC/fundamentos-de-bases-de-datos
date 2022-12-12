/*-----------------------------------------------------------------------------------
  Proyecto   : Ventas.
  Descripcion: Trigger para actualizar el precio de la venta
  Autor: Miguel Buitrago
--------------------------------------------------------------------------------------*/
CREATE OR REPLACE FUNCTION pr_insertar_venta_producto(
	pk_id_producto venta_producto.k_id_producto%TYPE,
	pk_id_venta venta_producto.k_id_venta%TYPE,
	pv_cantidad venta_producto.v_cantidad%TYPE)
RETURNS VOID AS $$
DECLARE
	lv_precio producto.v_precio%TYPE := 0;
	lv_total_producto venta_producto.v_total_producto%TYPE := 0;
BEGIN
	SELECT v_precio INTO lv_precio FROM producto WHERE k_id_producto = pk_id_producto;
	lv_total_producto := lv_precio*pv_cantidad;
	INSERT INTO venta_producto(k_id_producto,k_id_venta,v_cantidad,v_total_producto)
	VALUES
	(pk_id_producto, pk_id_venta, pv_cantidad, lv_total_producto);
END;
$$LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fu_actualizar_precio_venta()
RETURNS TRIGGER AS $tg_act_precio_venta$
DECLARE
	lk_id_producto venta_producto.k_id_producto%TYPE := 0;
	lk_id_venta venta_producto.k_id_venta%TYPE := 0;
	lv_precio_venta venta.v_precio_venta%TYPE := 0;
	lv_precio_venta_p venta.v_precio_venta%TYPE := 0;
	lv_precio_venta_pu venta.v_precio_venta%TYPE := 0;
	lv_monto_final_venta venta.v_monto_final%TYPE := 0;
	lv_descuento_venta venta.v_descuento%TYPE := 0;
	lv_precio producto.v_precio%TYPE := 0;
	lv_precio_u producto.v_precio%TYPE := 0;
	lv_cantidad venta_producto.v_cantidad%TYPE := 0;
BEGIN 
	IF (TG_OP = 'INSERT') THEN
		lk_id_producto := NEW.k_id_producto;
		SELECT v_precio INTO lv_precio FROM producto WHERE k_id_producto = lk_id_producto;
		lk_id_venta := NEW.k_id_venta;
		lv_cantidad := NEW.v_cantidad;
		SELECT v_monto_final INTO lv_monto_final_venta FROM venta WHERE k_id_venta = lk_id_venta;
		SELECT v_descuento INTO lv_descuento_venta FROM venta WHERE k_id_venta = lk_id_venta;
		IF(lv_monto_final_venta = 0) THEN
			lv_precio_venta = lv_precio*lv_cantidad;
			lv_monto_final_venta = lv_precio_venta-lv_descuento_venta;
		ELSE
			SELECT v_precio_venta INTO lv_precio_venta FROM venta WHERE k_id_venta = lk_id_venta;
			lv_monto_final_venta = lv_monto_final_venta+(lv_precio*lv_cantidad);
			lv_precio_venta = lv_precio_venta+(lv_precio*lv_cantidad);
		END IF;
		UPDATE venta SET v_precio_venta = lv_precio_venta WHERE k_id_venta = lk_id_venta;
		UPDATE venta SET v_monto_final = lv_monto_final_venta WHERE k_id_venta = lk_id_venta;
	END IF;
	IF (TG_OP = 'UPDATE') THEN
		lk_id_producto := OLD.k_id_producto;
		SELECT v_precio INTO lv_precio FROM producto WHERE k_id_producto = lk_id_producto;
		lk_id_venta := OLD.k_id_venta;
		SELECT v_precio_venta INTO lv_precio_venta FROM venta WHERE k_id_venta = lk_id_venta;
		SELECT v_monto_final INTO lv_monto_final_venta FROM venta WHERE k_id_venta = lk_id_venta;
		lv_cantidad := OLD.v_cantidad;
		lv_precio_venta_p = lv_precio*lv_cantidad; 
		lv_cantidad := NEW.v_cantidad;
		lv_precio_venta_pu = lv_precio*lv_cantidad;
		SELECT v_descuento INTO lv_descuento_venta FROM venta WHERE k_id_venta = lk_id_venta;
		lv_precio_venta = lv_precio_venta-lv_precio_venta_p+lv_precio_venta_pu;
		lv_monto_final_venta = lv_monto_final_venta-lv_precio_venta_p+lv_precio_venta_pu;
		UPDATE venta SET v_precio_venta = lv_precio_venta WHERE k_id_venta = lk_id_venta;
		UPDATE venta SET v_monto_final = lv_monto_final_venta WHERE k_id_venta = lk_id_venta;
	END IF;
	RETURN NULL;
END;
$tg_act_precio_venta$ LANGUAGE plpgsql;

CREATE TRIGGER tg_act_precio_venta
AFTER INSERT OR UPDATE OF k_id_producto, k_id_venta, v_cantidad ON venta_producto
FOR EACH ROW 
EXECUTE PROCEDURE fu_actualizar_precio_venta();

