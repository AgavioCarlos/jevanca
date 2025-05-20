-----Crear las tablas fragmentadas--------
CREATE TABLE tbl_inventario_norte LIKE tbl_inventario;
CREATE TABLE tbl_inventario_centro LIKE tbl_inventario;
CREATE TABLE tbl_inventario_sur LIKE tbl_inventario;


-----------------Mover los registros a los fragmentos---------------

-- Fragmento NORTE (id_zona = 1)
INSERT INTO tbl_inventario_norte (id_inventario, id_sucursal, id_producto, id_detalle_compra, stock_actual)
SELECT i.id_inventario, i.id_sucursal, i.id_producto, i.id_detalle_compra, i.stock_actual
FROM tbl_inventario i
JOIN tbl_sucursales s ON i.id_sucursal = s.id_sucursal
WHERE s.id_zona = 1;

-- Fragmento CENTRO (id_zona = 2)
INSERT INTO tbl_inventario_centro (id_inventario, id_sucursal, id_producto, id_detalle_compra, stock_actual)
SELECT i.id_inventario, i.id_sucursal, i.id_producto, i.id_detalle_compra, i.stock_actual
FROM tbl_inventario i
JOIN tbl_sucursales s ON i.id_sucursal = s.id_sucursal
WHERE s.id_zona = 2;

-- Fragmento SUR (id_zona = 3)
INSERT INTO tbl_inventario_sur (id_inventario, id_sucursal, id_producto, id_detalle_compra, stock_actual)
SELECT i.id_inventario, i.id_sucursal, i.id_producto, i.id_detalle_compra, i.stock_actual
FROM tbl_inventario i
JOIN tbl_sucursales s ON i.id_sucursal = s.id_sucursal
WHERE s.id_zona = 3;

--------Agrega el trigger para nuevos registros------------------

DELIMITER $$

CREATE TRIGGER tr_fragmentar_inventario
AFTER INSERT ON tbl_inventario
FOR EACH ROW
BEGIN
  DECLARE zona INT;
  SELECT id_zona INTO zona FROM tbl_sucursales WHERE id_sucursal = NEW.id_sucursal;

  IF zona = 1 THEN
    INSERT INTO tbl_inventario_norte (id_inventario, id_sucursal, id_producto, id_detalle_compra, stock_actual)
    VALUES (NEW.id_inventario, NEW.id_sucursal, NEW.id_producto, NEW.id_detalle_compra, NEW.stock_actual);
  ELSEIF zona = 2 THEN
    INSERT INTO tbl_inventario_centro (id_inventario, id_sucursal, id_producto, id_detalle_compra, stock_actual)
    VALUES (NEW.id_inventario, NEW.id_sucursal, NEW.id_producto, NEW.id_detalle_compra, NEW.stock_actual);
  ELSEIF zona = 3 THEN
    INSERT INTO tbl_inventario_sur (id_inventario, id_sucursal, id_producto, id_detalle_compra, stock_actual)
    VALUES (NEW.id_inventario, NEW.id_sucursal, NEW.id_producto, NEW.id_detalle_compra, NEW.stock_actual);
  END IF;
END$$

DELIMITER ;

