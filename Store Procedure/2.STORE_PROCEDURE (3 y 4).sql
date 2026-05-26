-- 3. TERCER PROCEDIMIENTO: REALIZAR BAJA LOGICA DE LA CLASE
-- Si un socio quiere darse de baja/cancelar una clase que este inscripto

CREATE PROCEDURE sp_Des_suscribirSocio
    @IDSocio INT,
    @IDClase INT
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY
        -- Insertamos la inscripción
        UPDATE Inscripciones 
        set Cancelada = 1
        where IDSocio = @IDSocio

        -- Restamos uno al cupo de la clase
        UPDATE Clases 
        SET CuposDisponibles = CuposDisponibles + 1 
        WHERE IDClase = @IDClase;

        COMMIT TRANSACTION;
        PRINT 'Socio Desinscripto correctamente.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

-- 4. Cuarto PROCEDIMIENTO: Crear un Instructor 
-- Sencillo para cuando pasemos a desarrollo (si es que lo hacemos)
 CREATE PROCEDURE sp_CrearInstructor
    @Nombre NVARCHAR(50),
    @Apellido NVARCHAR(50),
    @Especialidad NVARCHAR(50)
AS
BEGIN
    BEGIN TRY
        INSERT INTO Instructores
        (
            Nombre,
            Apellido,
            Especialidad
        )
        VALUES
        (
            @Nombre,
            @Apellido,
            @Especialidad
        );
        PRINT 'Instructor creado correctamente.';
    END TRY
    BEGIN CATCH
        PRINT 'Error al crear el instructor.';
        THROW;
    END CATCH
END;
GO

-- 5. Quinto PROCEDIMIENTO: REALIZAR BAJA LOGICA DE LA Instructor
-- Si un instructor quiere darse de baja o es despedido 

CREATE PROCEDURE sp_Baja_logica_Instructor
    @IDInstructor INT
    
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY
        -- Insertamos la inscripción
        UPDATE Instructores 
        set Activo = 0
        where IDInstructor = @IDInstructor


        COMMIT TRANSACTION;
        PRINT 'Instructor dado de baja correctamente.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

-- 6. Sexto PROCEDIMIENTO: REALIZAR Alta LOGICA DE LA Instructor
-- Si un instructor se da de Alta Nuevamente

Create PROCEDURE sp_Alta_logica_Instructor
    @IDInstructor INT
    
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY
        -- Insertamos la inscripción
        UPDATE Instructores 
        set Activo = 1
        where IDInstructor = @IDInstructor


        COMMIT TRANSACTION;
        PRINT 'Instructor dado de alta correctamente.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO