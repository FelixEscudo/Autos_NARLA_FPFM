-- =====================================================
-- Script 3: Consultas de exploración
-- Propósito: Verificar que los registros se insertaron correctamente
-- =====================================================

USE AutosNARLA;
GO

-- Mostrar todos los vehículos
SELECT * FROM Vehiculo;

-- Mostrar todas las ventas
SELECT * FROM Ventas;

-- Ejemplos de consultas con funciones agregadas
-- Cantidad de vehículos en stock
SELECT COUNT(*) AS TotalVehiculos FROM Vehiculo;

-- Promedio de precio de venta
SELECT AVG(PrecioVenta) AS PrecioPromedio FROM Vehiculo;

-- Vehículo más antiguo
SELECT TOP 1 * FROM Vehiculo ORDER BY AñoFabricacion ASC;

-- Vehículo con mayor cilindraje
SELECT TOP 1 * FROM Vehiculo ORDER BY Cilindraje DESC;

-- Vehículo con menor precio de venta
SELECT TOP 1 * FROM Vehiculo ORDER BY PrecioVenta ASC;

-- ==============================================
-- Confirmación: Mostrar los vendedores registrados
-- ==============================================

SELECT * FROM Vendedores;
GO

-- ==============================================
-- Confirmación: Mostrar las ventas con nombre del vendedor
-- ==============================================

SELECT 
    V.CodigoVenta,
    Veh.Marca,
    Veh.Modelo,
    C.Nombre AS NombreCliente,
    C.Apellido AS ApellidoCliente,
    VD.Nombre AS NombreVendedor,
    VD.Apellido AS ApellidoVendedor,
    V.FechaVenta,
    V.PrecioVenta,
    V.Descuento
FROM Ventas V
INNER JOIN Vehiculo Veh ON V.CodigoVehiculo = Veh.Codigo
LEFT JOIN Clientes C ON C.ClienteID = C.ClienteID
LEFT JOIN Vendedores VD ON V.VendedorID = VD.VendedorID;
GO

-- Mostrar todas las ventas con información del cliente y del vehículo
SELECT v.CodigoVenta, v.FechaVenta, v.PrecioVenta, v.Descuento,
       c.Nombre, c.Apellido,
       ve.Marca, ve.Modelo
FROM Ventas v
LEFT JOIN Clientes c ON v.ClienteID = c.ClienteID
LEFT JOIN Vehiculo ve ON v.CodigoVehiculo = ve.Codigo;

-- =====================================================
-- Confirmación: Ver relaciones activas en la base de datos
-- =====================================================
SELECT 
    f.name AS ForeignKeyName,
    OBJECT_NAME(f.parent_object_id) AS TablaHija,
    COL_NAME(fc.parent_object_id, fc.parent_column_id) AS ColumnaHija,
    OBJECT_NAME(f.referenced_object_id) AS TablaPadre,
    COL_NAME(fc.referenced_object_id, fc.referenced_column_id) AS ColumnaPadre
FROM sys.foreign_keys AS f
INNER JOIN sys.foreign_key_columns AS fc
    ON f.object_id = fc.constraint_object_id;
GO

