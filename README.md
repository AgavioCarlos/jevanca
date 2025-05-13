# 📘 Ejecución de Scripts del Sistema de Inventario

Este manual describe el orden correcto para ejecutar los scripts SQL del sistema de inventario. Seguir este orden garantiza que las relaciones entre tablas funcionen correctamente y evita errores al insertar datos o definir llaves foráneas.

## 🧾 Orden de ejecución

Asegúrate de ejecutar los archivos en el siguiente orden:

1. `01-Crear.sql`  
   Crea la base de datos y selecciona su uso con `USE`.

2. `02-Tablas.sql`  
   Contiene la definición de todas las tablas necesarias para el sistema: productos, proveedores, sucursales, compras, detalle de compras e inventario.

3. `03-Trigger.sql`  
   Define un *trigger* que permite poblar automáticamente la tabla `tbl_inventario` después de registrar una compra en `tbl_detalle_compra`.  
   > 📌 El trigger se activa automáticamente al insertar en `tbl_detalle_compra`.

4. `04-Registros.sql`  
   Contiene registros de ejemplo para poblar las tablas con datos como productos, proveedores, sucursales, compras y sus detalles.

5. `05-Consultas.sql`  
   Incluye consultas útiles para visualizar:
   - El inventario de una sucursal.
   - En qué sucursal se encuentra un producto específico.


