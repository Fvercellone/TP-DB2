USE GimnasioTPI;
GO

-- 1. VISTA: Para ver qué clases están llenas y cuáles tienen lugar
CREATE VIEW vw_DisponibilidadClases AS
SELECT 
    A.Nombre AS Actividad,
    C.FechaHora,
    C.CuposDisponibles,
    A.CapacidadMaxima,
    CASE 
        WHEN C.CuposDisponibles = 0 THEN 'LLENO'
        ELSE 'HAY CUPO'
    END AS Estado
FROM Clases C
INNER JOIN Actividades A ON C.IDActividad = A.IDActividad;
GO

-- 1. SEGUNDA VISTA: Resumen de Ventas por Plan
CREATE VIEW vw_IngresosPorPlan AS
SELECT 
    Pl.Nombre AS PlanNombre,
    COUNT(P.IDPago) AS CantidadPagos,
    SUM(P.Monto) AS TotalRecaudado
FROM Pagos P
INNER JOIN Membresias M ON P.IDMembresia = M.IDMembresia
INNER JOIN PlanesMembresia Pl ON M.IDPlan = Pl.IDPlan
GROUP BY Pl.Nombre;
GO

-- 2. TERCERA VISTA: Relación de Instructores, sus Clases y las Actividades que dictan
Create VIEW vw_InstructoresPorActividad AS
SELECT 
    A.IDActividad,
    A.Nombre AS Actividad,
    I.IDInstructor,
    P.Nombre AS InstructorNombre,
    P.Apellido AS InstructorApellido,
    C.IDClase AS [Numero de Clase],
    C.FechaHora AS HorarioClase
FROM Clases C
INNER JOIN Actividades A ON C.IDActividad = A.IDActividad
INNER JOIN Instructores I ON C.IDInstructor = I.IDInstructor
INNER JOIN Personas P ON I.IDPersona = P.IDPersona;
GO
/*
SELECT *
FROM vw_InstructoresPorActividad;

Select * from Personas

Select * from Instructores

Select * from ACtividades
Select * from Clases
*/

-- 3. TERCERA VISTA: Relación de Instructores y sus especialidades
Create VIEW vw_InstructoresPorEspecialidad AS
SELECT 

    I.IDInstructor,
    P.Nombre AS InstructorNombre,
    P.Apellido AS InstructorApellido,
    E.Nombre AS NombreEspecialidad
FROM Instructores I
INNER JOIN Especialidades E ON E.IDEspecialidad = I.IDInstructor
INNER JOIN Personas P ON I.IDPersona = P.IDPersona;
GO

/*
SELECT *
FROM vw_InstructoresPorEspecialidad;
*/

-- 4. TERCERA VISTA: Relación de Clases y sus especialidades
Create VIEW vw_ClasesPorEspecialidad AS
SELECT 
    
    C.IDClase AS [Numero de Clase],
    C.FechaHora AS HorarioClase,
    A.Nombre AS Actividad,
    E.nombre as NombreEspecialidad
FROM Clases C
INNER JOIN Actividades A ON C.IDActividad = A.IDActividad
INNER JOIN Especialidades E ON E.IDEspecialidad = C.IDClase
GO
/*
SELECT *
FROM vw_ClasesPorEspecialidad;
*/