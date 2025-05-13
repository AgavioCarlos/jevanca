INSERT INTO tbl_productos (producto, descripcion) VALUES
('Laptop', 'Laptop portátil con procesador i7, 16GB RAM, 512GB SSD'),
('Smartphone', 'Smartphone de última generación con cámara de 108MP y pantalla AMOLED'),
('Auriculares Bluetooth', 'Auriculares inalámbricos con cancelación de ruido'),
('Smartwatch', 'Reloj inteligente con monitor de ritmo cardíaco y GPS'),
('Teclado Mecánico', 'Teclado mecánico con retroiluminación RGB y switches Cherry MX'),
('Mouse Gaming', 'Mouse ergonómico para juegos con 16000 DPI y botones programables');
--------------------------------------------------------------------
INSERT INTO tbl_proveedor (proveedor, telefono, email) VALUES
('TechSolutions S.A.', '9992345678', 'contacto@techsolutions.com'),
('Innovative Electronics Corp.', '5598765432', 'ventas@innovativecorp.com'),
('GlobalTech Enterprises', '8112345678', 'info@globaltechenterprises.com');
--------------------------------------------------------------------------------------------------
INSERT INTO tbl_sucursales (sucursal, calle, numero_calle, colonia, municipio, estado) VALUES
('Jevanca Yucatán - Mérida', 'Av. 200', '120', 'Centro', 'Mérida', 'Yucatán'),
('Jevanca Ciudad de México - Roma Norte', 'Calle Oaxaca', '45', 'Roma Norte', 'Cuauhtémoc', 'Ciudad de México'),
('Jevanca Monterrey - San Pedro', 'Calle Madero', '300', 'San Pedro', 'San Pedro Garza García', 'Nuevo León');

-- Inserción de compras por proveedor a las sucursales
INSERT INTO tbl_compra (id_proveedor, id_sucursal, fecha_compra) VALUES
(1, 1, '2025-05-01'), -- Compra del proveedor 1 en la sucursal 1
(2, 2, '2025-05-02'), -- Compra del proveedor 2 en la sucursal 2
(3, 3, '2025-05-03'); -- Compra del proveedor 3 en la sucursal 3

----------------------------------------------------------------------
-- Inserción de detalles de compras por producto
INSERT INTO tbl_detalle_compra (id_compra, id_producto, unidades, precio_unitario) VALUES
(1, 1, 10, 100.00),  -- Compra de 10 unidades del producto 1 (Laptop) para la compra 1
(1, 2, 5, 200.00),   -- Compra de 5 unidades del producto 2 (Smartphone) para la compra 1
(2, 3, 8, 150.00),   -- Compra de 8 unidades del producto 3 (Tablet) para la compra 2
(2, 4, 6, 180.00),   -- Compra de 6 unidades del producto 4 (Smartwatch) para la compra 2
(3, 5, 12, 50.00),   -- Compra de 12 unidades del producto 5 (Teclado) para la compra 3
(3, 6, 15, 60.00);   -- Compra de 15 unidades del producto 6 (Ratón) para la compra 3
---------------------------------------------------------------------------------------