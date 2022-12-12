--  Primer punto
SELECT cliente.k_rut, n_nom_cliente, n_ape_cliente, n_producto, v_cantidad
FROM venta, venta_producto, producto, cliente
WHERE venta.k_id_venta = venta_producto.k_id_venta
AND venta_producto.k_id_producto = producto.k_id_producto
AND producto.k_id_producto = 86631
AND cliente.k_rut = venta.k_rut;

-- Tercer punto
SELECT venta.k_id_venta, venta.f_venta, TO_CHAR(venta.v_descuento, '$999,999.99') AS "v_descuento",
	TO_CHAR(venta.v_monto_final, '$999,999.99') AS "v_monto_final",
	TO_CHAR(venta.v_precio_venta, '$9,999,999.99') AS "v_precio_venta", venta.k_rut,
	producto.k_id_producto, producto.n_producto, producto.k_id_categoria, categoria.n_categoria
FROM venta, venta_producto, producto, categoria
WHERE venta.k_id_venta = 861084 
AND venta.k_id_venta = venta_producto.k_id_venta
AND venta_producto.k_id_producto = producto.k_id_producto
AND producto.k_id_categoria = categoria.k_id_categoria
ORDER BY n_categoria ASC, n_producto ASC;

-- Cuarto punto
SELECT proveedor.k_rut, CONCAT(n_calle, ' ', o_numero,' ', n_barrio,' ', n_ciudad) AS "direccion"
FROM proveedor, producto, venta_producto, venta
WHERE TO_CHAR(venta.f_venta, 'yyyy') = '2015'
AND venta.k_id_venta = venta_producto.k_id_venta
AND venta_producto.k_id_producto = producto.k_id_producto
AND producto.k_rut = proveedor.k_rut
ORDER BY proveedor.k_rut ASC;

-- Septimo punto
INSERT INTO categoria (k_id_categoria, n_categoria, o_des_categoria) VALUES (6412, 'Típicas', 'Empanadas típicas colombianas');
SELECT * FROM categoria;

-- Octavo punto
INSERT INTO producto (n_producto, k_rut, o_stock, k_id_categoria, k_id_producto, v_precio)
VALUES ('Empanadas', 981265142137, 100, 6412, 32451, 1200);
SELECT k_id_producto, TO_CHAR(v_precio, '$999,999.99') AS "v_precio", n_producto, o_stock, k_rut, k_id_categoria FROM producto;


-- Noveno - decimo punto
INSERT INTO venta_producto (k_id_producto, k_id_venta, v_cantidad, v_total_producto)
	VALUES                 (32451,         123456,     10,         12000);

INSERT INTO venta (k_id_venta, f_venta, v_descuento, v_monto_final, v_precio_venta, k_rut)
	VALUES        (123456,     NOW(),   0,           12000,         12000,          412649872697);

SELECT k_id_producto, k_id_venta, v_cantidad, TO_CHAR(v_total_producto, '$999,999.99') FROM venta_producto;

SELECT k_id_venta, f_venta, TO_CHAR(v_descuento, '$999,999.99') AS "v_descuento",
	TO_CHAR(v_monto_final, '$999,999.99') AS "v_monto_final", TO_CHAR(v_precio_venta, '$9,999,999.99') AS "v_precio_venta", k_rut
FROM venta;


