-- ===========================================
-- Transaction_SQL.sql
-- Práctica 2: Transacciones en la base de datos AutosNarla
-- Tablas utilizadas: Vehiculo, Clientes, Vendedores, Ventas
-- ===========================================

USE AutosNARLA;
GO

-- ===========================================
-- 1️⃣ TRANSACCIÓN: INSERTAR UN NUEVO CLIENTE
-- ===========================================
BEGIN TRANSACTION

BEGIN TRY
    INSERT INTO Clientes (Nombre, Apellido, Correo, Telefono, Direccion)
    VALUES ('Carlos', 'López', 'carlos.lopez@mail.com', '8888-7777', 'Managua');

    COMMIT TRANSACTION;
    PRINT 'Transacción 1 completada: Cliente agregado correctamente.';
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Error en Transacción 1: Se hizo rollback.';
    PRINT ERROR_MESSAGE();
END CATCH;
GO

-- ===========================================
-- 2️⃣ TRANSACCIÓN: INSERTAR UN NUEVO VEHICULO
-- ===========================================
BEGIN TRANSACTION

BEGIN TRY
    INSERT INTO Vehiculo (Codigo, Marca, Modelo, TipoVehiculo, AñoFabricacion, AñoProduccion, NumeroChasis, TipoCombustible, Cilindraje, PrecioAdquisicion, PrecioVenta, Stock)
    VALUES ('V001', 'Toyota', 'Hilux', 'PickUp', 2024, 2024, 'CH123456', 'Diesel', 2700, 25000, 32000, 5);

    COMMIT TRANSACTION;
    PRINT 'Transacción 2 completada: Vehiculo agregado correctamente.';
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Error en Transacción 2: Se hizo rollback.';
    PRINT ERROR_MESSAGE();
END CATCH;
GO

-- ===========================================
-- 3️⃣ TRANSACCIÓN: INSERTAR UN VENDEDOR
-- ===========================================
BEGIN TRANSACTION

BEGIN TRY
    INSERT INTO Vendedores (Nombre, Apellido, Telefono, Correo, Direccion)
    VALUES ('Ana', 'Gómez', '8999-5555', 'ana.gomez@mail.com', 'Managua');

    COMMIT TRANSACTION;
    PRINT 'Transacción 3 completada: Vendedor agregado correctamente.';
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Error en Transacción 3: Se hizo rollback.';
    PRINT ERROR_MESSAGE();
END CATCH;
GO

-- ===========================================
-- 4️⃣ TRANSACCIÓN: REGISTRAR UNA VENTA
-- ===========================================
BEGIN TRANSACTION

BEGIN TRY
    -- Tomar el último cliente, vehículo y vendedor insertado
    DECLARE @ClienteID INT = (SELECT TOP 1 ClienteID FROM Clientes ORDER BY ClienteID DESC);
    DECLARE @CodigoVehiculo NVARCHAR(50) = (SELECT TOP 1 Codigo FROM Vehiculo ORDER BY Codigo DESC);
    DECLARE @VendedorID INT = (SELECT TOP 1 VendedorID FROM Vendedores ORDER BY VendedorID DESC);

    INSERT INTO Ventas (CodigoVenta, CodigoVehiculo, FechaVenta, PrecioVenta, Descuento, VendedorID, ClienteID)
    VALUES ('VE001', @CodigoVehiculo, GETDATE(), 32000, 0, @VendedorID, @ClienteID);

    COMMIT TRANSACTION;
    PRINT 'Transacción 4 completada: Venta registrada correctamente.';
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Error en Transacción 4: Se hizo rollback.';
    PRINT ERROR_MESSAGE();
END CATCH;
GO

-- ===========================================
-- FIN DE LAS TRANSACCIONES
-- ===========================================
