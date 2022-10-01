CREATE DATABASE ecofit;

USE ecofit;

--tabla de los clientes
CREATE TABLE cliente(

    id INT(11) NOT NULL,
    nom_cliente CHAR(30) NOT NULL,
    apellido_cliente CHAR(30) NOT NULL,
    password VARCHAR(60) NOT NULL,
    telefono CHAR(50) NOT NULL,
    direccion_cliente VARCHAR(50) NOT NULL,
    rut_cliente VARCHAR(50) NOT NULL,
    email_cliente VARCHAR(320) NOT NULL,
    contacto_cliente CHAR(50) NOT NULL

);

ALTER TABLE cliente
    ADD PRIMARY KEY (id);

ALTER TABLE cliente
    MODIFY id INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 1;   


--tabals de las ventas
CREATE TABLE venta(

    id_venta INT(11) NOT NULL,
    fecha_venta TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    cantidad_venta CHAR(50) NOT NULL,
    modo_pago VARCHAR(30) NOT NULL,
    cliente_id INT(11),
    productoventa_id INT(11),
    envio_id INT(11),
    CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    CONSTRAINT fk_producto FOREIGN KEY ( productoventa_id) REFERENCES producto(id_producto),
    CONSTRAINT fk_envio FOREIGN KEY (envio_id) REFERENCES envio(id_envio)
    

);

ALTER TABLE venta
    ADD PRIMARY KEY (id_venta);

ALTER TABLE venta
    MODIFY id_venta INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 1; 

--TABLE de productos

CREATE TABLE producto (

    id_producto INT(11) NOT NULL,
    nom_producto CHAR(30) NOT NULL,
    description TEXT,
    precio_producto DECIMAL(10) NOT NULL,
    tipo_producto CHAR(30) NOT NULL,
    stock_producto CHAR(30) NOT NULL,
    proveedor_id INT(11),
    CONSTRAINT fk_proveedor FOREIGN KEY (proveedor_id) REFERENCES proveedor(id_proveedor)

);

ALTER TABLE producto 
    ADD PRIMARY KEY (id_producto);

ALTER TABLE producto 
    MODIFY id_producto INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 1; 

--tablas de envios 
CREATE TABLE envio(

    id_envio INT(11) NOT NULL,
    fecha_envio DATETIME,
    transporte_id INT(11),
    CONSTRAINT fk_transporte FOREIGN KEY (transporte_id) REFERENCES transporte(id_transporte)
);

ALTER TABLE envio 
    ADD PRIMARY KEY (id_envio);

ALTER TABLE envio
    MODIFY id_envio INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 1; 

--tabla de transporte
CREATE TABLE transporte (

     id_transporte INT(11) NOT NULL,
     nom_transporte CHAR(30) NOT NULL,
     direccion_transporte VARCHAR(50) NOT NULL,
     description_transporte TEXT
     
);

ALTER TABLE transporte
    ADD PRIMARY KEY (id_transporte);

ALTER TABLE transporte
    MODIFY id_transporte INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 1;


--tabla de los proveedores 
CREATE TABLE proveedor(

    id_proveedor INT(11) NOT NULL,
    nom_empresa CHAR(30) NOT NULL,
    telefono_empresa CHAR(50) NOT NULL,
    email_proveedor VARCHAR(320) NOT NULL,
    direccion_proveedor VARCHAR(50) NOT NULL,
    contanto_proveedor VARCHAR(50) NOT NULL

);


ALTER TABLE proveedor
    ADD PRIMARY KEY (id_proveedor);

ALTER TABLE transporte
    MODIFY id_proveedor INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 1;
    

--tabla de compra
CREATE TABLE compra(

    id_compra INT(11) NOT NULL,
    fecha_compra TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    pago_compra VARCHAR(30) NOT NULL,
    cantidad_compra VARCHAR(50) NOT NULL,
    producto_id INT(11),
    CONSTRAINT fk_producto FOREIGN KEY (producto_id) REFERENCES producto(id_producto)
);

ALTER TABLE compra
    ADD PRIMARY KEY (id_compra);

ALTER TABLE compra
    MODIFY id_compra INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 1;
    