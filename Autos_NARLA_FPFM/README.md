# 🚗 Proyecto Base de Datos: Autos NARLA

## 📄 Descripción General
El proyecto **Autos NARLA** fue creado como parte de la primera tarea del curso de **Programacion en Base de Datos**.  
Su objetivo principal es modelar y gestionar la información de un auto lote, incluyendo **vehículos, clientes, ventas y vendedores**.

Este proyecto está desarrollado en **SQL Server**, utilizando tres scripts principales que construyen la base de datos desde cero, insertan datos de ejemplo y realizan consultas SQL.

---

## 🎯 Objetivos del Sistema
- Crear una base de datos funcional llamada **AutosNARLA**.  
- Definir las tablas necesarias para la gestión de vehículos, clientes, vendedores y ventas.  
- Implementar claves primarias y foráneas correctamente.  
- Realizar consultas para mostrar relaciones entre las tablas y evidencias de registros.

---

## 🧩 Estructura del Proyecto

El repositorio contiene los siguientes archivos y carpetas:

```
AutosNARLA/
│
├── 📁 ScriptSQL/
│   ├── 1_Creacion_BD.sql
│   ├── 2_Insercion_Datos.sql
│   └── 3_Consultas.sql
│
├── 📁 Diagramas/
│   └── AutosNARLA_Modelo.dm1   ← Archivo generado en ER/Studio
│
└── README.md
```

---

## 🗂️ Estructura de la Base de Datos

### Tablas principales:
- **Vehiculos**
  - IDVehiculo, Marca, Modelo, Año, PrecioAdquisicion, PrecioVenta, Estado
- **Clientes**
  - IDCliente, Nombre, Telefono, Direccion
- **Vendedores**
  - IDVendedor, Nombre, Telefono
- **Ventas**
  - IDVenta, IDVehiculo, IDCliente, IDVendedor, FechaVenta, Descuento, PrecioFinal

### Relaciones:
- Un **cliente** puede tener **una o varias ventas**.  
- Un **vendedor** puede realizar **múltiples ventas**.  
- Cada **vehículo** está asociado a una venta o disponible para venta.  
- Las relaciones se encuentran representadas en el archivo **AutosNARLA_Modelo.dm1** del diagrama ER.

---

## ⚙️ Pasos para Ejecutar el Proyecto

1. Abrir **SQL Server Management Studio (SSMS)**.  
2. Ejecutar los scripts en este orden:
   - `1_Creacion_BD.sql` → Crea la base de datos y las tablas.
   - `2_Insercion_Datos.sql` → Inserta los registros de ejemplo.
   - `3_Consultas.sql` → Muestra resultados y evidencias de las relaciones.
3. Abrir **ER/Studio 8.0** y cargar el archivo:
   ```
   Diagramas/AutosNARLA_Modelo.dm1
   ```
   para visualizar el **diagrama entidad-relación**.

---

## 👤 Autor
**Nombre:** Felix  
**Curso:** Programacion en Base de Datos (SQL Server)  
**Fecha:** Octubre 2025  
**Institución:** — *( UNAN - Managua)*

---

## 🧾 Notas Finales
Este proyecto está diseñado con la posibilidad de **expansión futura**, permitiendo agregar nuevas tablas como mantenimiento, facturación, historial de precios y más.  
La estructura modular y los nombres consistentes facilitan su ampliación sin alterar la base existente.

---
