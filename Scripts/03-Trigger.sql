DELIMITER $$

CREATE TRIGGER after_insert_detalle_compra
AFTER INSERT ON tbl_detalle_compra
FOR EACH ROW
BEGIN
    DECLARE existing_stock INT;
    DECLARE sucursal_id INT;

    -- Obtener el id_sucursal desde la tabla tbl_compra usando id_compra
    SELECT id_sucursal INTO sucursal_id
    FROM tbl_compra
    WHERE id_compra = NEW.id_compra;

    -- Verificar si existe el producto en el inventario de la sucursal
    SELECT stock_actual INTO existing_stock
    FROM tbl_inventario
    WHERE id_sucursal = sucursal_id
      AND id_producto = NEW.id_producto;

    -- Si existe el inventario, actualizamos el stock
    IF existing_stock IS NOT NULL THEN
        UPDATE tbl_inventario
        SET stock_actual = stock_actual + NEW.unidades
        WHERE id_sucursal = sucursal_id
          AND id_producto = NEW.id_producto;
    ELSE
        -- Si no existe el inventario, insertamos un nuevo registro
        INSERT INTO tbl_inventario (id_sucursal, id_producto, id_detalle_compra, stock_actual)
        VALUES (sucursal_id, NEW.id_producto, NEW.id_detalle_compra, NEW.unidades);
    END IF;
END$$

DELIMITER ;
