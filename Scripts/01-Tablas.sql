CREATE TABLE tbl_productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    producto VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Tabla de proveedores
CREATE TABLE tbl_proveedor (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    proveedor VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100)
);

-- Tabla de sucursales
CREATE TABLE tbl_sucursales (
    id_sucursal INT AUTO_INCREMENT PRIMARY KEY,
    sucursal VARCHAR(100) NOT NULL,
    calle VARCHAR(100),
    numero_calle VARCHAR(10),
    colonia VARCHAR(100),
    municipio VARCHAR(100),
    estado VARCHAR(100)
);

-- Tabla de compras
CREATE TABLE tbl_compra (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_proveedor INT NOT NULL,
    id_sucursal INT NOT NULL,
    fecha_compra DATE NOT NULL,
    FOREIGN KEY (id_proveedor) REFERENCES tbl_proveedor(id_proveedor),
    FOREIGN KEY (id_sucursal) REFERENCES tbl_sucursales(id_sucursal)
);

-- Tabla de detalle de compras
CREATE TABLE tbl_detalle_compra (
    id_detalle_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_compra INT NOT NULL,
    id_producto INT NOT NULL,
    unidades INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_compra) REFERENCES tbl_compra(id_compra),
    FOREIGN KEY (id_producto) REFERENCES tbl_productos(id_producto)
);

-- Tabla de inventario
CREATE TABLE tbl_inventario (
    id_inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_sucursal INT NOT NULL,
    id_producto INT NOT NULL,
    id_detalle_compra INT NOT NULL,
    stock_actual INT NOT NULL,
    FOREIGN KEY (id_sucursal) REFERENCES tbl_sucursales(id_sucursal),
    FOREIGN KEY (id_producto) REFERENCES tbl_productos(id_producto),
    FOREIGN KEY (id_detalle_compra) REFERENCES tbl_detalle_compra(id_detalle_compra)
);
