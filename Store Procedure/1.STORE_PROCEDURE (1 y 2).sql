USE GimnasioTPI;
GO

-- 1. PROCEDIMIENTO: Para inscribir un socio y que reste el cupo automáticamente
CREATE PROCEDURE sp_InscribirSocio
    @IDSocio INT,
    @IDClase INT
AS
BEGIN
    BEGIN TRY
     BEGIN TRANSACTION
        -- Insertamos la inscripción
        INSERT INTO Inscripciones (IDSocio, IDClase, FechaInscripcion, Cancelada)
        VALUES (@IDSocio, @IDClase, GETDATE(), 0);

        -- Restamos uno al cupo de la clase
        UPDATE Clases 
        SET CuposDisponibles = CuposDisponibles - 1 
        WHERE IDClase = @IDClase;

        COMMIT TRANSACTION;
        PRINT 'Socio inscripto correctamente.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

-- 2. SEGUNDO PROCEDIMIENTO: Cambiar Instructor de una Clase
-- Útil si un profesor se enferma y hay que cambiarlo rápido en todas las clases
CREATE PROCEDURE sp_CambiarInstructorClase
    @IDClase INT,
    @NuevoIDInstructor INT
AS
BEGIN
   BEGIN TRY
     BEGIN TRANSACTION
    UPDATE Clases 
    SET IDInstructor = @NuevoIDInstructor 
    WHERE IDClase = @IDClase;

    COMMIT TRANSACTION;
            PRINT 'Instructor actualizado correctamente en la clase.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'Error al intentar cambiar el instructor.';
        THROW;
    END CATCH
END;
GO