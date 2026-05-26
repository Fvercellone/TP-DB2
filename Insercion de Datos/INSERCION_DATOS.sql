USE GimnasioTPI;
GO

-- 1. Planes de Membresía
INSERT INTO PlanesMembresia (Nombre, DuracionDias, Precio, Descripcion) VALUES 
('Plan Inicial', 30, 12000, 'Solo sala de musculación'),
('Plan Fitness', 30, 18000, 'Musculación + 2 clases semanales'),
('Plan Black', 30, 25000, 'Acceso total ilimitado'),
('Plan Anual', 365, 180000, 'Pago adelantado con 20% off');

-- 2. Instructores
INSERT INTO Instructores (Nombre, Apellido, Especialidad) VALUES 
('Carlos', 'Gomez', 'Yoga y Pilates'),
('Laura', 'Manson', 'Crossfit'),
('Ricardo', 'Fort', 'Musculación'),
('Elena', 'Perez', 'Zumba');

-- 3. Actividades
INSERT INTO Actividades (Nombre, CapacidadMaxima) VALUES 
('Yoga', 15), ('Crossfit', 10), ('Zumba', 25), ('Spinning', 12);

-- 4. Socios (Mezclamos algunos con apto al día y otros vencidos)
INSERT INTO Socios (Nombre, Aspellido, Email, FechaNacimiento, FechaVencimientoAptoMedico) VALUES 
('Lucas', 'Rodriguez', 'lucas@mail.com', '1980-05-12', '2027-01-15'),
('Enzo', 'Ferrari', 'enzo@mail.com', '2000-02-18', '2027-03-12'),
('Diego', 'Maradona', 'diego@mail.com', '1985-10-30', '2023-01-01'), 
('Sofia', 'Lopez', 'sofi@mail.com', '1980-11-22', '2026-12-10'), 
('Bruno', 'Castro', 'bruno@mail.com', '2002-08-08', '2027-04-20'),
('Mateo', 'Diaz', 'mateo@mail.com', '1985-11-05', '2024-05-10'), 
('Delfina', 'Paz', 'delfi@mail.com', '2005-07-12', '2026-05-15'),
('Nicolas', 'Romero', 'nico@mail.com', '1990-04-12', '2027-08-01'),
('Valentina', 'Fernandez', 'valen@mail.com', '1987-02-14', '2027-02-14'),
('Tomas', 'Muller', 'tomi@mail.com', '2005-01-30', '2027-02-28'), 
('Julian', 'Ruiz', 'juli@mail.com', '1990-07-20', '2026-10-05'), 
('Martina', 'Sosa', 'marti@mail.com', '1995-12-01', '2023-06-15'), 
('Santi', 'Moro', 'santi@mail.com', '2006-12-25', '2027-11-11'),
('Agustina', 'Torres', 'agus@mail.com', '1995-09-18', '2027-01-15'), 
('Lorena', 'Paez', 'lore@mail.com', '1985-04-15', '2027-02-14'), 
('Ariel', 'Ortega', 'burrito@mail.com', '2002-03-04', '2027-09-10'), 
('Lucia', 'Acosta', 'lucia@mail.com', '1995-05-05', '2026-09-30'), 
('Facundo', 'Benitez', 'facu@mail.com', '1995-01-25', '2024-12-20'), 
('Victoria', 'Gimenez', 'vicky@mail.com', '2000-10-10', '2023-11-11'), 
('Camila', 'Alvarez', 'cami@mail.com', '1990-06-30', '2026-11-25'), 
('Milagros', 'Duarte', 'mili@mail.com', '2005-09-14', '2024-01-10'), 
('Carla', 'Vigo', 'carla@mail.com', '2006-03-14', '2027-01-01'), 
('Roberto', 'Carlos', 'rober@mail.com', '1980-02-10', '2027-12-01'), 
('Lionel', 'Cuccittini', 'leo@mail.com', '1987-06-24', '2027-06-24'),
('Micaela', 'Suarez', 'mica@mail.com', '2003-04-12', '2026-08-15');

-- 5. Clases (Programamos algunas para hoy)
INSERT INTO Clases (IDActividad, IDInstructor, FechaHora, CuposDisponibles) VALUES 
(1, 1, GETDATE(), 15), -- Yoga con Carlos
(2, 2, GETDATE(), 10), -- Crossfit con Laura
(3, 4, GETDATE(), 25); -- Zumba con Elena
GO