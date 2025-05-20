--------- Crear las tablas fragmentadas --------------
CREATE TABLE tbl_detalle_compra_norte LIKE tbl_detalle_compra;
CREATE TABLE tbl_detalle_compra_centro LIKE tbl_detalle_compra;
CREATE TABLE tbl_detalle_compra_sur LIKE tbl_detalle_compra;

-------------Mover los registros actuales a los fragmentos--------------

INSERT INTO tbl_detalle_compra_norte (id_detalle_compra, id_compra, id_producto, unidades, precio_unitario)
SELECT d.id_detalle_compra, d.id_compra, d.id_producto, d.unidades, d.precio_unitario
FROM tbl_detalle_compra d
JOIN tbl_compra c ON d.id_compra = c.id_compra
JOIN tbl_sucursales s ON c.id_sucursal = s.id_sucursal
WHERE s.id_zona = 1;

INSERT INTO tbl_detalle_compra_centro (id_detalle_compra, id_compra, id_producto, unidades, precio_unitario)
SELECT d.id_detalle_compra, d.id_compra, d.id_producto, d.unidades, d.precio_unitario
FROM tbl_detalle_compra d
JOIN tbl_compra c ON d.id_compra = c.id_compra
JOIN tbl_sucursales s ON c.id_sucursal = s.id_sucursal
WHERE s.id_zona = 2;

INSERT INTO tbl_detalle_compra_sur (id_detalle_compra, id_compra, id_producto, unidades, precio_unitario)
SELECT d.id_detalle_compra, d.id_compra, d.id_producto, d.unidades, d.precio_unitario
FROM tbl_detalle_compra d
JOIN tbl_compra c ON d.id_compra = c.id_compra
JOIN tbl_sucursales s ON c.id_sucursal = s.id_sucursal
WHERE s.id_zona = 3;

---------Trigger para nuevos registros-------------
DELIMITER $$

CREATE TRIGGER tr_fragmentar_detalle_compra
AFTER INSERT ON tbl_detalle_compra
FOR EACH ROW
BEGIN
  DECLARE zona INT;
  SELECT s.id_zona INTO zona
    FROM tbl_compra c
    JOIN tbl_sucursales s ON c.id_sucursal = s.id_sucursal
    WHERE c.id_compra = NEW.id_compra;

  IF zona = 1 THEN
    INSERT INTO tbl_detalle_compra_norte (id_compra, id_producto, unidades, precio_unitario)
    VALUES (NEW.id_compra, NEW.id_producto, NEW.unidades, NEW.precio_unitario);
  ELSEIF zona = 2 THEN
    INSERT INTO tbl_detalle_compra_centro (id_compra, id_producto, unidades, precio_unitario)
    VALUES (NEW.id_compra, NEW.id_producto, NEW.unidades, NEW.precio_unitario);
  ELSEIF zona = 3 THEN
    INSERT INTO tbl_detalle_compra_sur (id_compra, id_producto, unidades, precio_unitario)
    VALUES (NEW.id_compra, NEW.id_producto, NEW.unidades, NEW.precio_unitario);
  END IF;
END$$

DELIMITER ;
