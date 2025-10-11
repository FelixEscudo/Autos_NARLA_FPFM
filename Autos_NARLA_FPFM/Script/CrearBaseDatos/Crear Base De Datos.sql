-- =====================================================
-- Script 1: Crear Base de Datos y Tablas
-- Propósito: Crear la base de datos Autos NARLA y sus tablas principales
-- Fecha: 08/10/2025
-- =====================================================

USE master;
GO

-- Eliminar base de datos si existe
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'AutosNARLA')
BEGIN
    ALTER DATABASE AutosNARLA SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE AutosNARLA;
END
GO

-- Crear base de datos nueva
CREATE DATABASE AutosNARLA;
GO

-- Usar la base recién creada
USE AutosNARLA;
GO

-- =====================================================
-- Tabla: Vehiculo
-- Propósito: Registrar todos los vehículos disponibles en el inventario
-- =====================================================
CREATE TABLE Vehiculo (
    Codigo INT PRIMARY KEY,
    Marca NVARCHAR(50) NOT NULL,
    Modelo NVARCHAR(50) NOT NULL,
    TipoVehiculo NVARCHAR(50) NOT NULL,
    AñoFabricacion INT NOT NULL,
    AñoProduccion INT NOT NULL,
    NumeroChasis NVARCHAR(50) NOT NULL,
    TipoCombustible NVARCHAR(20),
    Cilindraje INT,
    PrecioAdquisicion NUMERIC(10,2),
    PrecioVenta NUMERIC(10,2),
    Stock INT,
    Foto1 NVARCHAR(MAX),
    Foto2 NVARCHAR(MAX),
    Foto3 NVARCHAR(MAX),
    Foto4 NVARCHAR(MAX),
    Foto5 NVARCHAR(MAX),
    Foto6 NVARCHAR(MAX),
    Foto7 NVARCHAR(MAX),
    Foto8 NVARCHAR(MAX)
);
GO

-- =====================================================
-- Tabla: Clientes
-- Descripción: Almacena la información de los clientes
-- =====================================================
CREATE TABLE Clientes (
    ClienteID INT IDENTITY(1,1) PRIMARY KEY, -- Identificador único del cliente
    Nombre NVARCHAR(50) NOT NULL,           -- Nombre completo del cliente
    Apellido NVARCHAR(50) NOT NULL,         -- Apellido del cliente
    Correo NVARCHAR(100),                   -- Correo electrónico
    Telefono NVARCHAR(20),                  -- Teléfono de contacto
    Direccion NVARCHAR(150)                 -- Dirección del cliente
);
GO

-- ==============================================
-- Tabla: Vendedores
-- Descripción: Registra los datos de los vendedores del autolote
-- ==============================================

CREATE TABLE Vendedores (
    VendedorID INT IDENTITY(1,1) PRIMARY KEY,  -- Identificador único
    Nombre NVARCHAR(50) NOT NULL,
    Apellido NVARCHAR(50) NOT NULL,
    Telefono NVARCHAR(20),
    Correo NVARCHAR(100),
    Direccion NVARCHAR(150)
);
GO

-- ==============================================
-- Ajuste a la tabla Ventas para relacionarla con Vendedores
-- ==============================================

ALTER TABLE Ventas
ADD VendedorID INT NULL;

ALTER TABLE Ventas
ADD CONSTRAINT FK_Ventas_Vendedores FOREIGN KEY (VendedorID)
    REFERENCES Vendedores(VendedorID)
    ON DELETE SET NULL
    ON UPDATE CASCADE;
GO


-- =====================================================
-- Tabla: Ventas
-- Descripción: Registra las ventas de vehículos a clientes
-- =====================================================
CREATE TABLE Ventas (
    CodigoVenta INT IDENTITY(1,1) PRIMARY KEY,  -- Código único para la venta
    CodigoVehiculo INT NOT NULL,                -- Debe coincidir con Vehiculo.Codigo
    FechaVenta DATE NOT NULL,
    PrecioVenta NUMERIC(10,2) NOT NULL,
    Descuento NUMERIC(10,2) DEFAULT 0,
    CONSTRAINT FK_Ventas_Vehiculo FOREIGN KEY (CodigoVehiculo)
        REFERENCES Vehiculo(Codigo)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
GO

-- Confirmación: Mostrar tablas creadas
SELECT * FROM sys.tables;
