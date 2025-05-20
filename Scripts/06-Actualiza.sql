CREATE TABLE cat_zona (
  id_zona INT PRIMARY KEY,
  nombre_zona VARCHAR(20) NOT NULL
);


-- Ejemplo de inserción de zonas
INSERT INTO cat_zona (id_zona, nombre_zona) VALUES
  (1, 'Norte'),
  (2, 'Centro'),
  (3, 'Sur');

ALTER TABLE tbl_sucursales ADD COLUMN id_zona INT;

ALTER TABLE tbl_sucursales
  ADD CONSTRAINT fk_zona
    FOREIGN KEY (id_zona)
    REFERENCES cat_zona(id_zona);

UPDATE tbl_sucursales SET id_zona = 3 WHERE estado = 'Yucatán';
UPDATE tbl_sucursales SET id_zona = 2 WHERE estado = 'Ciudad de México';
UPDATE tbl_sucursales SET id_zona = 1 WHERE estado = 'Nuevo León';

SELECT * FROM tbl_sucursales;