-- 3. Tercer TRIGGER: Impedir eliminar Inscripciones de socios
-- Esto evita que se pierda la inscripcion realiza por x socio, lo cual si el mismo por x motivo decide cancelar su suscripcion la misma figure en estado cancelada y el cupo se sume en +1
CREATE TRIGGER trg_BajaLogicaInscripciones
ON Inscripciones
INSTEAD OF DELETE
AS
BEGIN
    -- Baja lógica de la inscripción
    UPDATE I
    SET Cancelada = 1
    FROM Inscripciones I
    INNER JOIN deleted D 
        ON I.IDSocio = D.IDSocio AND I.IDClase = D.IDClase
    WHERE I.Cancelada = 0;

    -- Devolver cupo a la clase
    UPDATE C
    SET C.CuposDisponibles = C.CuposDisponibles + 1
    FROM Clases C
    INNER JOIN deleted D 
        ON C.IDClase = D.IDClase
    INNER JOIN Inscripciones I 
        ON I.IDSocio = D.IDSocio AND I.IDClase = D.IDClase
    WHERE D.Cancelada = 0;
END;
GO

-- 4. Cuarto TRIGGER: Impedir eliminar fisicamente Instructores
-- Esto evita que se pierdan los datos de los intructores que ya no trabajan o se dieron de baja
CREATE TRIGGER trg_BajaLogicaInstructores
ON Instructores
INSTEAD OF DELETE
AS
BEGIN
    UPDATE I
    SET I.Activo = 0
    FROM Instructores I
    INNER JOIN deleted D ON I.IDInstructor = D.IDInstructor
    WHERE I.Activo = 1;
END;
GO