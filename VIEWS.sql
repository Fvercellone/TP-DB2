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
JOIN Actividades A ON C.IDActividad = A.IDActividad;
GO

-- 1. SEGUNDA VISTA: Resumen de Ventas por Plan
CREATE VIEW vw_IngresosPorPlan AS
SELECT 
    Pl.Nombre AS PlanNombre,
    COUNT(P.IDPago) AS CantidadPagos,
    SUM(P.Monto) AS TotalRecaudado
FROM Pagos P
JOIN Membresias M ON P.IDMembresia = M.IDMembresia
JOIN PlanesMembresia Pl ON M.IDPlan = Pl.IDPlan
GROUP BY Pl.Nombre;
GO