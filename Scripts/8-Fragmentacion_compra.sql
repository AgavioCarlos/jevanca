-----Crear las tablas fragmentadas--------
CREATE TABLE tbl_compra_norte LIKE tbl_compra;
CREATE TABLE tbl_compra_centro LIKE tbl_compra;
CREATE TABLE tbl_compra_sur LIKE tbl_compra;

-----------------Mover los registros a los fragmentos---------------

INSERT INTO tbl_compra_norte (id_compra, id_proveedor, id_sucursal, fecha_compra)
SELECT c.id_compra, c.id_proveedor, c.id_sucursal, c.fecha_compra
FROM tbl_compra c
JOIN tbl_sucursales s ON c.id_sucursal = s.id_sucursal
WHERE s.id_zona = 1;

INSERT INTO tbl_compra_centro (id_compra, id_proveedor, id_sucursal, fecha_compra)
SELECT c.id_compra, c.id_proveedor, c.id_sucursal, c.fecha_compra
FROM tbl_compra c
JOIN tbl_sucursales s ON c.id_sucursal = s.id_sucursal
WHERE s.id_zona = 2;

INSERT INTO tbl_compra_sur (id_compra, id_proveedor, id_sucursal, fecha_compra)
SELECT c.id_compra, c.id_proveedor, c.id_sucursal, c.fecha_compra
FROM tbl_compra c
JOIN tbl_sucursales s ON c.id_sucursal = s.id_sucursal
WHERE s.id_zona = 3;

------Trigger para nuevos registros-----------

DELIMITER $$

CREATE TRIGGER tr_fragmentar_compra
AFTER INSERT ON tbl_compra
FOR EACH ROW
BEGIN
  DECLARE zona INT;
  SELECT id_zona INTO zona FROM tbl_sucursales WHERE id_sucursal = NEW.id_sucursal;

  IF zona = 1 THEN
    INSERT INTO tbl_compra_norte (id_proveedor, id_sucursal, fecha_compra)
    VALUES (NEW.id_proveedor, NEW.id_sucursal, NEW.fecha_compra);
  ELSEIF zona = 2 THEN
    INSERT INTO tbl_compra_centro (id_proveedor, id_sucursal, fecha_compra)
    VALUES (NEW.id_proveedor, NEW.id_sucursal, NEW.fecha_compra);
  ELSEIF zona = 3 THEN
    INSERT INTO tbl_compra_sur (id_proveedor, id_sucursal, fecha_compra)
    VALUES (NEW.id_proveedor, NEW.id_sucursal, NEW.fecha_compra);
  END IF;
END$$

DELIMITER ;
