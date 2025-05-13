--Consulta para ver el inventario de una sucursal--
SELECT
    s.sucursal AS Sucursal,
    p.producto AS Producto,
    p.descripcion AS Descripción,
    i.stock_actual AS Stock,
    d.precio_unitario AS PrecioUnitario
FROM
    tbl_inventario i
JOIN tbl_sucursales s ON i.id_sucursal = s.id_sucursal
JOIN tbl_productos p ON i.id_producto = p.id_producto
JOIN tbl_detalle_compra d ON i.id_detalle_compra = d.id_detalle_compra
WHERE
    s.id_sucursal = 3;  -- Reemplaza '1' con el ID de la sucursal deseada

-----------------------------------------
SELECT
    p.producto AS Producto,
    s.sucursal AS Sucursal,
    s.estado AS Estado,
    i.stock_actual AS StockDisponible
FROM
    tbl_inventario i
JOIN tbl_productos p ON i.id_producto = p.id_producto
JOIN tbl_sucursales s ON i.id_sucursal = s.id_sucursal
WHERE
    p.producto LIKE '%Teclado%';
