CREATE TABLE cliente(
	k_rut 			NUMERIC(12) NOT NULL,
	n_nom_cliente 	VARCHAR(15) NOT NULL,
	n_ape_cliente 	VARCHAR(15) NOT NULL,
	n_calle 		VARCHAR(20) NOT NULL,
	o_numero 		NUMERIC(3) NOT NULL,
	n_barrio 		VARCHAR(15) NOT NULL,
	n_ciudad		VARCHAR(15) NOT NULL,
	v_limite_c		NUMERIC(7)  NOT NULL,
	v_saldo			NUMERIC(9,2) NOT NULL
);
ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY (k_rut);
ALTER TABLE cliente ADD CONSTRAINT k_rut_chk CHECK (k_rut>99999999999);
ALTER TABLE cliente ADD CONSTRAINT o_numero_chk CHECK (o_numero>0);
ALTER TABLE cliente ADD CONSTRAINT v_limite_c_chk CHECK (v_limite_c>=0 AND v_limite_c<=5000000);
COMMENT ON TABLE  cliente IS 'Tabla que contiene el registro de cada uno de los clientes';
COMMENT ON COLUMN cliente.k_rut IS 'RUT del cliente';
COMMENT ON COLUMN cliente.n_calle IS 'Nombre de la calle';
COMMENT ON COLUMN cliente.o_numero IS 'Numero de calle';
COMMENT ON COLUMN cliente.n_barrio IS 'Nombre del barrio';
COMMENT ON COLUMN cliente.n_ciudad IS 'Nombre de la ciudad';
COMMENT ON COLUMN cliente.v_limite_c IS 'Valor del limite de credito';
COMMENT ON COLUMN cliente.v_saldo IS 'Valor del saldo del credito del cliente';

CREATE TABLE telefono(
	k_telefono	VARCHAR(10) NOT NULL,
	k_rut		NUMERIC(12) NOT NULL
);
ALTER TABLE telefono ADD CONSTRAINT telefono_pk PRIMARY KEY (k_telefono,k_rut);
ALTER TABLE telefono ADD CONSTRAINT telefono_cliente_fk FOREIGN KEY (k_rut) REFERENCES cliente (k_rut);
COMMENT ON TABLE  telefono IS 'Tabla que contiene los telefonos de cada cliente';
COMMENT ON COLUMN telefono.k_telefono IS 'Numero del telefono';
COMMENT ON COLUMN telefono.k_rut IS 'RUT del cliente';

CREATE TABLE proveedor(
	k_rut 		NUMERIC(12) NOT NULL,
	n_calle 	VARCHAR(20) NOT NULL,
	o_numero 	NUMERIC(3) NOT NULL,
	n_barrio 	VARCHAR(15) NOT NULL,
	n_ciudad	VARCHAR(15) NOT NULL,
	o_pag_web	VARCHAR(30) NOT NULL
);
ALTER TABLE proveedor ADD CONSTRAINT proveedor_pk PRIMARY KEY (k_rut);
ALTER TABLE proveedor ADD CONSTRAINT k_rutp_chk CHECK (k_rut>99999999999);
ALTER TABLE proveedor ADD CONSTRAINT o_numerop_chk CHECK (o_numero>0);
COMMENT ON TABLE  proveedor IS 'Tabla que contiene el registro de los proveedores';
COMMENT ON COLUMN proveedor.k_rut IS 'RUT del proveedor';
COMMENT ON COLUMN proveedor.n_calle IS 'Nombre de la calle';
COMMENT ON COLUMN proveedor.o_numero IS 'Numero de calle';
COMMENT ON COLUMN proveedor.n_barrio IS 'Nombre del barrio';
COMMENT ON COLUMN proveedor.n_ciudad IS 'Nombre de la ciudad';
COMMENT ON COLUMN proveedor.o_pag_web IS 'Direccion de la pagina web del proveedor';

CREATE TABLE venta(
	k_id_venta		NUMERIC(6) NOT NULL,
	f_venta			DATE NOT NULL,
	v_descuento		NUMERIC(12,2) NOT NULL,
	v_monto_final	NUMERIC(12,2) NOT NULL,
	v_precio_venta	NUMERIC(12,2) NOT NULL,
	k_rut			NUMERIC(12) NOT NULL
);
ALTER TABLE venta ADD CONSTRAINT venta_pk PRIMARY KEY (k_id_venta);
ALTER TABLE venta ADD CONSTRAINT venta_cliente_fk FOREIGN KEY (k_rut) REFERENCES cliente;
ALTER TABLE venta ADD CONSTRAINT v_descuento_chk CHECK (v_descuento>=0);
COMMENT ON TABLE  venta IS 'Tabla que contiene el registro de las ventas con identificador y con fecha';
COMMENT ON COLUMN venta.k_id_venta IS 'Identificador de cada venta';
COMMENT ON COLUMN venta.f_venta IS 'Fecha en que se realizo la venta';
COMMENT ON COLUMN venta.v_descuento IS 'Valor del porcentaje de descuento a la venta';
COMMENT ON COLUMN venta.v_monto_final IS 'Valor final que se le va a cobrar al cliente';
COMMENT ON COLUMN venta.v_precio_venta IS 'Valor de la venta antes de aplicar el descuento';
COMMENT ON COLUMN venta.k_rut IS 'RUT del comprador';

CREATE TABLE categoria(
	k_id_categoria	NUMERIC(4) NOT NULL,
	n_categoria		VARCHAR(20) NOT NULL,
	o_des_categoria	VARCHAR(200) NOT NULL
);
ALTER TABLE categoria ADD CONSTRAINT categoria_pk PRIMARY KEY (k_id_categoria);
COMMENT ON TABLE  categoria IS 'Tabla que contiene la información de las categorias de los productos';
COMMENT ON COLUMN categoria.k_id_categoria IS 'Identificado de la categoria';
COMMENT ON COLUMN categoria.n_categoria IS 'Nombre de la categoria';
COMMENT ON COLUMN categoria.o_des_categoria IS 'Descripción de la categoria';

CREATE TABLE producto(
	k_id_producto	NUMERIC(5) NOT NULL,
	v_precio		NUMERIC(12,2) NOT NULL,
	n_producto		VARCHAR(40) NOT NULL,
	o_stock			NUMERIC(3) NOT NULL,
	k_rut			NUMERIC(12) NOT NULL,
	k_id_categoria	NUMERIC(4) NOT NULL 
);
ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY (k_id_producto);
ALTER TABLE producto ADD CONSTRAINT producto_proveedore_fk FOREIGN KEY (k_rut) REFERENCES proveedor;
ALTER TABLE producto ADD CONSTRAINT producto_categoria_fk FOREIGN KEY (k_id_categoria) REFERENCES categoria;
ALTER TABLE producto ADD CONSTRAINT v_precio_chk CHECK (v_precio>0);
COMMENT ON TABLE  producto IS 'Tabla que contiene el registro de los producto disponibles para la venta';
COMMENT ON COLUMN producto.k_id_producto IS 'Identificador del producto';
COMMENT ON COLUMN producto.v_precio IS 'Valor del precio del producto';
COMMENT ON COLUMN producto.n_producto IS 'Nombre del producto';
COMMENT ON COLUMN producto.o_stock IS 'Existencia del producto';
COMMENT ON COLUMN producto.k_rut IS 'RUT del proveedor';
COMMENT ON COLUMN producto.k_id_categoria IS 'Identificador de la categoria del producto';

CREATE TABLE venta_producto(
	k_id_producto		NUMERIC(5) NOT NULL,
	k_id_venta			NUMERIC(6) NOT NULL,
	v_cantidad			NUMERIC(3) NOT NULL,
	v_total_producto	NUMERIC(12,2) NOT NULL
);
ALTER TABLE venta_producto ADD CONSTRAINT venta_producto_pk PRIMARY KEY (k_id_producto,k_id_venta);
ALTER TABLE venta_producto ADD CONSTRAINT venta_producto_prod_fk FOREIGN KEY (k_id_producto) REFERENCES producto;
ALTER TABLE venta_producto ADD CONSTRAINT venta_producto_vent_fk FOREIGN KEY (k_id_venta) REFERENCES venta;
ALTER TABLE venta_producto ADD CONSTRAINT v_cantidad_chk CHECK (v_cantidad>0);
COMMENT ON TABLE  venta_producto IS 'Tabla que contiene el registro de las cantidades de cada producto por venta';
COMMENT ON COLUMN venta_producto.k_id_producto IS 'Identificador del producto vendido';
COMMENT ON COLUMN venta_producto.k_id_venta IS 'Identificador de la venta';
COMMENT ON COLUMN venta_producto.v_cantidad IS 'Cantidad del producto vendido en la venta';
COMMENT ON COLUMN venta_producto.v_total_producto IS 'Precio total del producto vendido (cantidadxprecio)';