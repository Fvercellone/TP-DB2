USE master;
GO

-- Intentamos borrarla de forma simple
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'GimnasioTPI')
BEGIN
    ALTER DATABASE GimnasioTPI SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE GimnasioTPI;
END
GO

-- La creamos de nuevo
CREATE DATABASE GimnasioTPI;
GO

USE GimnasioTPI;
GO

-- 1. TABLAS (DML)
CREATE TABLE Personas (
    IDPersona INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Apellido NVARCHAR(50) NOT NULL,
    Email NVARCHAR(50) NOT NULL UNIQUE,
    Telefono NVARCHAR(20),
    FechaNacimiento DATE NOT NULL
);

CREATE TABLE Socios (
    IDSocio INT IDENTITY(1,1) PRIMARY KEY,
    IDPersona INT NOT NULL FOREIGN KEY REFERENCES Personas(IDPersona),
    FechaAlta DATE DEFAULT GETDATE(),
    Activo BIT NOT NULL DEFAULT 1,
    FechaVencimientoAptoMedico DATETIME NOT NULL
);

CREATE TABLE PlanesMembresia (
    IDPlan INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    DuracionDias INT NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    Descripcion NVARCHAR(255)
);

CREATE TABLE Membresias (
    IDMembresia INT IDENTITY(1,1) PRIMARY KEY,
    IDSocio INT NOT NULL FOREIGN KEY REFERENCES Socios(IDSocio),
    IDPlan INT NOT NULL FOREIGN KEY REFERENCES PlanesMembresia(IDPlan),
    FechaInicio DATE NOT NULL,
    FechaVencimiento DATE NOT NULL,
    Activa BIT NOT NULL DEFAULT 1
);

CREATE TABLE MetodoPago (
    IDMetodoPago INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Activo BIT NOT NULL DEFAULT 1
);

CREATE TABLE Pagos (
    IDPago INT IDENTITY(1,1) PRIMARY KEY,
    IDMembresia INT NOT NULL FOREIGN KEY REFERENCES Membresias(IDMembresia),
    FechaPago DATETIME DEFAULT GETDATE(),
    Monto DECIMAL(10,2) NOT NULL,
    MetodoPago INT NOT NULL FOREIGN KEY REFERENCES MetodoPago(IDMetodoPago),
    Observacion NVARCHAR(255) 
);

CREATE TABLE Especialidades (
    IDEspecialidad INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
);

CREATE TABLE Instructores (
    IDInstructor INT IDENTITY(1,1) PRIMARY KEY,
    IDPersona INT NOT NULL FOREIGN KEY REFERENCES Personas(IDPersona),
    IDEspecialidad INT NOT NULL FOREIGN KEY REFERENCES Especialidades(IDEspecialidad),
    Activo BIT NOT NULL DEFAULT 1
);

CREATE TABLE Actividades (
    IDActividad INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    CapacidadMaxima INT NOT NULL,
    Activo BIT NOT NULL DEFAULT 1,
    IDEspecialidad INT NOT NULL FOREIGN KEY REFERENCES Especialidades(IDEspecialidad)
);

CREATE TABLE Salon (
    IDSalon INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Descripcion NVARCHAR(50),
    Activo BIT NOT NULL DEFAULT 1
);

CREATE TABLE Clases (
    IDClase INT IDENTITY(1,1) PRIMARY KEY,
    IDActividad INT NOT NULL FOREIGN KEY REFERENCES Actividades(IDActividad),
    IDInstructor INT NOT NULL FOREIGN KEY REFERENCES Instructores(IDInstructor),
    IDSalon INT NOT NULL FOREIGN KEY REFERENCES Salon(IDSalon),
    FechaHora DATETIME NOT NULL,
    CuposDisponibles INT NOT NULL,
    Activo BIT NOT NULL DEFAULT 1
);

CREATE TABLE Inscripciones (
    IDInscripcion INT IDENTITY(1,1) PRIMARY KEY,
    IDSocio INT NOT NULL FOREIGN KEY REFERENCES Socios(IDSocio),
    IDClase INT NOT NULL FOREIGN KEY REFERENCES Clases(IDClase),
    FechaInscripcion DATETIME DEFAULT GETDATE(),
    Cancelada BIT NOT NULL DEFAULT 1
);

GO
