USE GimnasioTPI;
GO

-- 3. TRIGGER: El "Guardián". No deja inscribir si el Apto Médico está vencido.
CREATE TRIGGER trg_ValidarAptoMedico
ON Inscripciones
INSTEAD OF INSERT
AS
BEGIN
    -- Si el socio tiene el apto vencido, lanzamos error
    IF EXISTS (
        SELECT 1 FROM Socios S
        JOIN inserted I ON S.IDSocio = I.IDSocio
        WHERE S.FechaVencimientoAptoMedico < GETDATE()
    )
    BEGIN
        RAISERROR('ERROR: El socio no puede inscribirse porque tiene el APTO MÉDICO VENCIDO.', 16, 1);
    END
    ELSE
    BEGIN
        -- Si está todo bien, hacemos la inserción real
        INSERT INTO Inscripciones (IDSocio, IDClase, FechaInscripcion, Cancelada)
        SELECT IDSocio, IDClase, FechaInscripcion, Cancelada FROM inserted;
    END
END;
GO

-- 3. SEGUNDO TRIGGER: Impedir eliminar Socios con cuotas activas
-- Esto evita que se pierda el historial financiero
CREATE TRIGGER trg_NoBorrarSocioConMembresia
ON Socios
INSTEAD OF DELETE
AS
BEGIN
    RAISERROR('No se puede eliminar el socio. Para darlo de baja, cambie su estado a Activo = 0.', 16, 1);
END;
GO