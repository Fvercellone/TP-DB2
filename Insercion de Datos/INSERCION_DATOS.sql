USE GimnasioTPI;
GO

-- 1. Planes de Membresía
INSERT INTO PlanesMembresia (Nombre, DuracionDias, Precio, Descripcion) VALUES 
('Plan Inicial', 30, 12000, 'Solo sala de musculación'),
('Plan Fitness', 30, 18000, 'Musculación + 2 clases semanales'),
('Plan Black', 30, 25000, 'Acceso total ilimitado'),
('Plan Anual', 365, 180000, 'Pago adelantado con 20% off');

-- 2. Actividades
INSERT INTO Actividades (Nombre, CapacidadMaxima) VALUES 
('Yoga', 15), ('Crossfit', 10), ('Zumba', 25), ('Spinning', 12);

-- 3. Instructores
DECLARE @IdPers INT;

-- Instructor 1
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento)
VALUES ('Carlos', 'Gomez', 'carlos@mail.com', '11223344', '1980-01-01');
SET @IdPers = SCOPE_IDENTITY();
INSERT INTO Instructores (IDPersona, IDEspecialidad, Activo) VALUES (@IdPers, 1, 1); -- Especialidad 1 (Yoga y Pilates)

-- Instructor 2
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento)
VALUES ('Laura', 'Manson', 'laura@mail.com', '11556677', '1985-05-05');
SET @IdPers = SCOPE_IDENTITY();
INSERT INTO Instructores (IDPersona, IDEspecialidad, Activo) VALUES (@IdPers, 2, 1); -- Especialidad 2 (Crossfit)

-- Instructor 3
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento)
VALUES ('Ricardo', 'Fort', 'ricardito@mail.com', '11998822', '1975-11-05');
SET @IdPers = SCOPE_IDENTITY();
INSERT INTO Instructores (IDPersona, IDEspecialidad, Activo) VALUES (@IdPers, 3, 1); -- Especialidad 3 (Musculación)

-- Instructor 4
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento)
VALUES ('Elena', 'Perez', 'elena@mail.com', '11447788', '1990-03-03');
SET @IdPers = SCOPE_IDENTITY();
INSERT INTO Instructores (IDPersona, IDEspecialidad, Activo) VALUES (@IdPers, 4, 1); -- Especialidad 4 (Zumba)



-- 4. Socios (Mezclamos algunos con apto al día y otros vencidos)
-- Socio 1:
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento) 
VALUES ('Lucas', 'Rodriguez', 'lucas@mail.com', '15000001', '1980-05-12');
INSERT INTO Socios (IDPersona, FechaAlta, Activo, FechaVencimientoAptoMedico) 
VALUES (SCOPE_IDENTITY(), GETDATE(), 1, '2027-01-15');

-- Socio 2: 
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento) 
VALUES ('Enzo', 'Ferrari', 'enzo@mail.com', '15000002', '2000-02-18');
INSERT INTO Socios (IDPersona, FechaAlta, Activo, FechaVencimientoAptoMedico) 
VALUES (SCOPE_IDENTITY(), GETDATE(), 1, '2027-03-12');

-- Socio 3: 
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento) 
VALUES ('Diego', 'Maradona', 'diego@mail.com', '15000003', '1965-10-30');
INSERT INTO Socios (IDPersona, FechaAlta, Activo, FechaVencimientoAptoMedico) 
VALUES (SCOPE_IDENTITY(), GETDATE(), 1, '2023-01-01');

-- Socio 4: 
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento) 
VALUES ('Sofia', 'Lopez', 'sofia@mail.com', '15000004', '1980-11-22');
INSERT INTO Socios (IDPersona, FechaAlta, Activo, FechaVencimientoAptoMedico) 
VALUES (SCOPE_IDENTITY(), GETDATE(), 1, '2026-12-10');

-- Socio 5: 
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento) 
VALUES ('Bruno', 'Castro', 'bruno@mail.com', '15000005', '2002-08-08');
INSERT INTO Socios (IDPersona, FechaAlta, Activo, FechaVencimientoAptoMedico) 
VALUES (SCOPE_IDENTITY(), GETDATE(), 1, '2027-04-20');

-- Socio 6: 
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento) 
VALUES ('Mateo', 'Diaz', 'mateo@mail.com', '15000006', '1985-11-05');
INSERT INTO Socios (IDPersona, FechaAlta, Activo, FechaVencimientoAptoMedico) 
VALUES (SCOPE_IDENTITY(), GETDATE(), 1, '2024-05-10');

-- Socio 7:
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento) 
VALUES ('Delfina', 'Paz', 'delfi@mail.com', '15000007', '2005-07-12');
INSERT INTO Socios (IDPersona, FechaAlta, Activo, FechaVencimientoAptoMedico) 
VALUES (SCOPE_IDENTITY(), GETDATE(), 1, '2026-05-15');

-- Socio 8: 
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento) 
VALUES ('Nicolas', 'Romero', 'nico@mail.com', '15000008', '1990-04-12');
INSERT INTO Socios (IDPersona, FechaAlta, Activo, FechaVencimientoAptoMedico) 
VALUES (SCOPE_IDENTITY(), GETDATE(), 1, '2027-08-01');

-- Socio 9: 
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento) 
VALUES ('Valentina', 'Fernandez', 'valen@mail.com', '15000009', '1987-02-14');
INSERT INTO Socios (IDPersona, FechaAlta, Activo, FechaVencimientoAptoMedico) 
VALUES (SCOPE_IDENTITY(), GETDATE(), 1, '2027-02-14');

-- Socio 10: 
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento) 
VALUES ('Tomas', 'Muller', 'tomi@mail.com', '15000010', '2005-01-30');
INSERT INTO Socios (IDPersona, FechaAlta, Activo, FechaVencimientoAptoMedico) 
VALUES (SCOPE_IDENTITY(), GETDATE(), 1, '2027-02-28');

-- Socio 11:
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento) 
VALUES ('Julian', 'Ruiz', 'juli@mail.com', '15000011', '1990-07-20');
INSERT INTO Socios (IDPersona, FechaAlta, Activo, FechaVencimientoAptoMedico) 
VALUES (SCOPE_IDENTITY(), GETDATE(), 1, '2026-10-05');

-- Socio 12: 
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento) 
VALUES ('Martina', 'Sosa', 'marti@mail.com', '15000012', '1995-12-01');
INSERT INTO Socios (IDPersona, FechaAlta, Activo, FechaVencimientoAptoMedico) 
VALUES (SCOPE_IDENTITY(), GETDATE(), 1, '2023-06-15');

-- Socio 13: 
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento) 
VALUES ('Santi', 'Moro', 'santi@mail.com', '15000013', '2006-12-25');
INSERT INTO Socios (IDPersona, FechaAlta, Activo, FechaVencimientoAptoMedico) 
VALUES (SCOPE_IDENTITY(), GETDATE(), 1, '2027-11-11');

-- Socio 14: 
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento) 
VALUES ('Agustina', 'Torres', 'agus@mail.com', '15000014', '1995-09-18');
INSERT INTO Socios (IDPersona, FechaAlta, Activo, FechaVencimientoAptoMedico) 
VALUES (SCOPE_IDENTITY(), GETDATE(), 1, '2027-01-15');

-- Socio 15: 
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento) 
VALUES ('Lorena', 'Paez', 'lore@mail.com', '15000015', '1985-04-15');
INSERT INTO Socios (IDPersona, FechaAlta, Activo, FechaVencimientoAptoMedico) 
VALUES (SCOPE_IDENTITY(), GETDATE(), 1, '2027-02-14');

-- Socio 16: 
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento) 
VALUES ('Ariel', 'Ortega', 'burrito@mail.com', '15000016', '2002-03-04');
INSERT INTO Socios (IDPersona, FechaAlta, Activo, FechaVencimientoAptoMedico) 
VALUES (SCOPE_IDENTITY(), GETDATE(), 1, '2027-09-10');

-- Socio 17: 
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento) 
VALUES ('Lucia', 'Acosta', 'lucia@mail.com', '15000017', '1995-05-05');
INSERT INTO Socios (IDPersona, FechaAlta, Activo, FechaVencimientoAptoMedico) 
VALUES (SCOPE_IDENTITY(), GETDATE(), 1, '2026-09-30');

-- Socio 18: 
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento) 
VALUES ('Facundo', 'Benitez', 'facu@mail.com', '15000018', '1995-01-25');
INSERT INTO Socios (IDPersona, FechaAlta, Activo, FechaVencimientoAptoMedico) 
VALUES (SCOPE_IDENTITY(), GETDATE(), 1, '2024-12-20');

-- Socio 19:
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento) 
VALUES ('Victoria', 'Gimenez', 'vicky@mail.com', '15000019', '2000-10-10');
INSERT INTO Socios (IDPersona, FechaAlta, Activo, FechaVencimientoAptoMedico) 
VALUES (SCOPE_IDENTITY(), GETDATE(), 1, '2023-11-11');

-- Socio 20: 
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento) 
VALUES ('Camila', 'Alvarez', 'cami@mail.com', '15000020', '1990-06-30');
INSERT INTO Socios (IDPersona, FechaAlta, Activo, FechaVencimientoAptoMedico) 
VALUES (SCOPE_IDENTITY(), GETDATE(), 1, '2026-11-25');

-- Socio 21:
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento) 
VALUES ('Milagros', 'Duarte', 'mili@mail.com', '15000021', '2005-09-14');
INSERT INTO Socios (IDPersona, FechaAlta, Activo, FechaVencimientoAptoMedico) 
VALUES (SCOPE_IDENTITY(), GETDATE(), 1, '2024-01-10');

-- Socio 22:
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento) 
VALUES ('Carla', 'Vigo', 'carla@mail.com', '15000022', '2006-03-14');
INSERT INTO Socios (IDPersona, FechaAlta, Activo, FechaVencimientoAptoMedico) 
VALUES (SCOPE_IDENTITY(), GETDATE(), 1, '2027-01-01');

-- Socio 23: 
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento) 
VALUES ('Roberto', 'Carlos', 'rober@mail.com', '15000023', '1980-02-10');
INSERT INTO Socios (IDPersona, FechaAlta, Activo, FechaVencimientoAptoMedico) 
VALUES (SCOPE_IDENTITY(), GETDATE(), 1, '2027-12-01');

-- Socio 24:
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento) 
VALUES ('Lionel', 'Cuccittini', 'leo@mail.com', '15000024', '1987-06-24');
INSERT INTO Socios (IDPersona, FechaAlta, Activo, FechaVencimientoAptoMedico) 
VALUES (SCOPE_IDENTITY(), GETDATE(), 1, '2027-06-24');

-- Socio 25:
INSERT INTO Personas (Nombre, Apellido, Email, Telefono, FechaNacimiento) 
VALUES ('Micaela', 'Suarez', 'mica@mail.com', '15000025', '2003-04-12');
INSERT INTO Socios (IDPersona, FechaAlta, Activo, FechaVencimientoAptoMedico) 
VALUES (SCOPE_IDENTITY(), GETDATE(), 1, '2026-08-15');

-- 5. Clases (Programamos algunas para hoy)
INSERT INTO Clases (IDActividad, IDInstructor, FechaHora, CuposDisponibles, Salon) VALUES 
(1, 1, GETDATE(), 15, 'Salón A'), -- Yoga con Carlos
(2, 2, GETDATE(), 10, 'Zona Box'), -- Crossfit con Laura
(3, 4, GETDATE(), 25, 'Salón B'); -- Zumba con Elena
GO