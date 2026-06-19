USE GimnasioTPI;
GO

-- 1. PRIMER PROCEDIMIENTO: Para inscribir un socio y que reste el cupo automáticamente
CREATE PROCEDURE sp_InscribirSocio
    @IDSocio INT,
    @IDClase INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Validar que la clase exista
        IF NOT EXISTS (
            SELECT 1
            FROM Clases
            WHERE IDClase = @IDClase
        )
        BEGIN
            RAISERROR('La clase no existe.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END;

        -- Validar que el socio no esté ya inscripto en esa clase
        IF EXISTS (
            SELECT 1
            FROM Inscripciones
            WHERE IDSocio = @IDSocio
              AND IDClase = @IDClase
              AND Cancelada = 0
        )
        BEGIN
            RAISERROR('El socio ya está inscripto en esta clase.', 16, 2);
            ROLLBACK TRANSACTION;
            RETURN;
        END;

        -- Validar que haya cupos disponibles
        IF (
            SELECT CuposDisponibles
            FROM Clases
            WHERE IDClase = @IDClase
        ) <= 0
        BEGIN
            RAISERROR('No hay cupos disponibles para esta clase.', 16, 3);
            ROLLBACK TRANSACTION;
            RETURN;
        END;

        -- Insertar inscripción
        INSERT INTO Inscripciones 
        (
            IDSocio, 
            IDClase, 
            FechaInscripcion, 
            Cancelada
        )
        VALUES 
        (
            @IDSocio, 
            @IDClase, 
            GETDATE(), 
            0
        );

        -- Restar cupo
        UPDATE Clases 
        SET CuposDisponibles = CuposDisponibles - 1 
        WHERE IDClase = @IDClase;

        COMMIT TRANSACTION;
        PRINT 'Socio inscripto correctamente.';
    END TRY
    BEGIN CATCH
      IF @@TRANCOUNT > 0
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