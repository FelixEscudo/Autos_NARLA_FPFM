-- =====================================================
-- Script 2: Insertar registros iniciales en la base
-- Propósito: Poblar las tablas Vehiculo y Ventas
-- =====================================================

USE AutosNARLA;
GO

-- Limpiar registros anteriores para evitar duplicados
-- EJECUTAR SOLO SI YA HAY DATOS Y QUIERES REINSERTAR
DELETE FROM Ventas;
DELETE FROM Vehiculo;
GO

-- =====================================================
-- Insertar registros en la tabla Vehiculo
-- =====================================================
INSERT INTO Vehiculo (Codigo, Marca, Modelo, AñoFabricacion, AñoProduccion, NumeroChasis, TipoCombustible, Cilindraje, TipoVehiculo, PrecioAdquisicion, PrecioVenta, Stock, Foto1, Foto2, Foto3, Foto4, Foto5, Foto6, Foto7, Foto8)
VALUES
(1, 'Toyota', 'Corolla', 2019, 2019, 'CH123', 'Gasolina', 1800, 'Sedan', 14000.00, 15000.00, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Honda', 'Civic', 2020, 2020, 'CH124', 'Gasolina', 2000, 'Sedan', 20000.00, 22000.00, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Ford', 'Focus', 2018, 2018, 'CH125', 'Gasolina', 1600, 'Hatchback', 17000.00, 18000.00, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Chevrolet', 'Camaro', 2017, 2017, 'CH126', 'Gasolina', 2500, 'Coupe', 24000.00, 25000.00, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'BMW', 'X3', 2021, 2021, 'CH127', 'Gasolina', 3000, 'SUV', 28000.00, 30000.00, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
GO

-- =====================================================
-- Insertar registros en la tabla Ventas
-- =====================================================
INSERT INTO Ventas (CodigoVehiculo, FechaVenta, PrecioVenta, Descuento)
VALUES
(1, '2025-10-01', 15000.00, 0.00),
(2, '2025-10-02', 22000.00, 500.00),
(3, '2025-10-03', 18000.00, 1000.00),
(4, '2025-10-04', 25000.00, 0.00),
(5, '2025-10-05', 30000.00, 1500.00);
GO

-- ==============================================
-- Insertar registros en la tabla Vendedores
-- ==============================================

INSERT INTO Vendedores (Nombre, Apellido, Telefono, Correo, Direccion)
VALUES
('Carlos', 'Ramírez', '8888-1234', 'carlos.ramirez@autonarla.com', 'Managua, Nicaragua'),
('Lucía', 'González', '8877-4321', 'lucia.gonzalez@autonarla.com', 'Masaya, Nicaragua'),
('Pedro', 'López', '8899-5678', 'pedro.lopez@autonarla.com', 'León, Nicaragua');
GO

-- ==============================================
-- Actualizar ventas con vendedores asignados
-- ==============================================

UPDATE Ventas SET VendedorID = 1 WHERE CodigoVenta = 1;
UPDATE Ventas SET VendedorID = 2 WHERE CodigoVenta = 2;
UPDATE Ventas SET VendedorID = 3 WHERE CodigoVenta = 3;
UPDATE Ventas SET VendedorID = 1 WHERE CodigoVenta = 4;
UPDATE Ventas SET VendedorID = 2 WHERE CodigoVenta = 5;
GO


USE AutosNARLA;
GO

-- =====================================================
-- Paso 1: Agregar la columna ClienteID a la tabla Ventas
-- =====================================================
ALTER TABLE Ventas
ADD ClienteID INT NULL;
GO

-- =====================================================
-- Paso 2: Crear la relación entre Ventas y Clientes
-- =====================================================
ALTER TABLE Ventas
ADD CONSTRAINT FK_Ventas_Clientes
FOREIGN KEY (ClienteID)
REFERENCES Clientes(ClienteID)
ON DELETE SET NULL
ON UPDATE CASCADE;
GO

-- =====================================================
-- Paso 3: Confirmar que la columna se haya agregado
-- =====================================================
EXEC sp_help 'Ventas';
GO



-- =====================================================
-- Confirmación: Mostrar registros insertados
-- =====================================================
SELECT * FROM Vehiculo;
SELECT * FROM Ventas;
SELECT * FROM Vendedores;
