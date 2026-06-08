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
    PM.Nombre AS PlanNombre,
    COUNT(P.IDPago) AS CantidadPagos,
    SUM(P.Monto) AS TotalRecaudado
FROM Pagos P
INNER JOIN Membresias M ON P.IDMembresia = M.IDMembresia
INNER JOIN PlanesMembresia Pl ON M.IDPlan = PM.IDPlan
GROUP BY PM.Nombre;
GO

-- 2. TERCERA VISTA: Relación de Instructores, sus Especialidades y las Actividades que dictan
CREATE VIEW vw_InstructoresPorActividad AS
SELECT 
    A.IDActividad,
    A.Nombre AS Actividad,
    I.IDInstructor,
    I.Nombre AS InstructorNombre,     
    I.Apellido AS InstructorApellido,
    C.FechaHora AS HorarioClase
FROM Clases C
INNER JOIN Actividades A ON C.IDActividad = A.IDActividad
INNER JOIN Instructores I ON C.IDInstructor = I.IDInstructor
GO
