USE GimnasioTPI;
GO

-- 3. TERCER PROCEDIMIENTO: REALIZAR BAJA LOGICA DE LA CLASE
-- Si un socio quiere darse de baja/cancelar una clase que este inscripto
CREATE PROCEDURE sp_Des_suscribirSocio
    @IDSocio INT,
    @IDClase INT
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY

     -- Validar que la inscripción exista y esté activa (no cancelada)
        IF NOT EXISTS (
            SELECT 1
            FROM Inscripciones
            WHERE IDSocio = @IDSocio
              AND IDClase = @IDClase
              AND Cancelada = 0
        )
        BEGIN
            RAISERROR('No existe una inscripción activa para ese socio en esa clase.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END;

        -- Insertamos la inscripción
        UPDATE Inscripciones 
        SET Cancelada = 1
        WHERE IDSocio = @IDSocio AND IDClase = @IDClase

        -- Restamos uno al cupo de la clase
        UPDATE Clases 
        SET CuposDisponibles = CuposDisponibles + 1 
        WHERE IDClase = @IDClase;

        COMMIT TRANSACTION;
        PRINT 'Socio Desinscripto correctamente.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

Select * from Instructores
Select * from Personas
GO

-- 4. CUARTO PROCEDIMIENTO: Crear Persona

CREATE PROCEDURE sp_CrearPersona
    
    @Nombre NVARCHAR(50),
    @Apellido NVARCHAR(50),
    @Email NVARCHAR(50),
    @Telefono VARCHAR(20),
    @FechaNacimiento DATE
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Personas 
        (
            Nombre, 
            Apellido, 
            Email, 
            Telefono, 
            FechaNacimiento
        )
        VALUES 
        (
            @Nombre, 
            @Apellido, 
            @Email, 
            @Telefono, 
            @FechaNacimiento
        );

        COMMIT TRANSACTION;

        PRINT 'Persona creada correctamente en el sistema.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        PRINT 'Error al crear la Persona.';
        THROW;
    END CATCH
END;
GO

-- 5. QUINTO PROCEDIMIENTO: Crear instructor

CREATE PROCEDURE sp_CrearInstructor
    
    @IDPersona INT,
    @IDEspecialidad INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Instructores 
        (
            IDPersona, 
            IDEspecialidad, 
            Activo
        )
        VALUES 
        (
            @IDPersona, 
            @IDEspecialidad, 
            1
        );
        COMMIT TRANSACTION;

        PRINT 'Instructor creado correctamente en el sistema.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        PRINT 'Error al crear el instructor.';
        THROW;
    END CATCH
END;
GO

-- 6. SEXTO PROCEDIMIENTO: REALIZAR BAJA LOGICA DEL INSTRUCTOR
-- Si un instructor quiere darse de baja o es despedido 

CREATE PROCEDURE sp_Baja_logica_Instructor
    @IDInstructor INT
    
AS
BEGIN
   BEGIN TRY
    BEGIN TRANSACTION
        -- Insertamos la inscripción
        UPDATE Instructores 
        SET Activo = 0
        WHERE IDInstructor = @IDInstructor;

        COMMIT TRANSACTION;
        PRINT 'Instructor dado de baja correctamente.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO


-- 7. SEPTIMO PROCEDIMIENTO: REALIZAR ALTA LOGICA DEL INSTRUCTOR
-- Si un instructor se da de Alta Nuevamente

Create PROCEDURE sp_Alta_logica_Instructor
    @IDInstructor INT
    
AS
BEGIN
    BEGIN TRY
      BEGIN TRANSACTION
        -- Insertamos la inscripción
        UPDATE Instructores 
        SET Activo = 1
        WHERE IDInstructor = @IDInstructor;

        COMMIT TRANSACTION;
        PRINT 'Instructor dado de alta correctamente.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

-- 8. OCTAVO PROCEDIMIENTO: Cantidad de instructores por especialidad.

CREATE PROCEDURE sp_ContarInstructoresPorEspecialidad

AS
BEGIN
    BEGIN TRY

        SELECT
            E.Nombre AS Especialidad,
            COUNT(I.IDInstructor) AS CantidadInstructores
        FROM Especialidades E
        LEFT JOIN Instructores I
            ON E.IDEspecialidad = I.IDEspecialidad
            AND I.Activo = 1
        GROUP BY E.Nombre
        ORDER BY E.Nombre;

    END TRY
    BEGIN CATCH
        PRINT 'Error al contar instructores por especialidad.';
        THROW;
    END CATCH
END;
GO

-- 9. NOVENO PROCEDIMIENTO: Cantidad de instructores por actividad
CREATE PROCEDURE sp_ContarInstructoresPorActividad

AS
BEGIN
    BEGIN TRY

        SELECT
            A.Nombre AS Actividad,
            COUNT(DISTINCT C.IDInstructor) AS CantidadInstructores
        FROM Actividades A
        LEFT JOIN Clases C
            ON A.IDActividad = C.IDActividad
        GROUP BY A.Nombre
        ORDER BY A.Nombre;

    END TRY
    BEGIN CATCH
        PRINT 'Error al contar instructores por actividad.';
        THROW;
    END CATCH
END;
GO

-- 10. DECIMO PROCEDIMIENTO: Cantidad de alumnos por actividad
CREATE PROCEDURE sp_AlumnosPorActividad
AS
BEGIN
    SELECT 
        a.IDActividad,
        a.Nombre AS Actividad,
        COUNT(i.IDInscripcion) AS CantidadAlumnos
    FROM Actividades a
    INNER JOIN Clases c ON a.IDActividad = c.IDActividad
    INNER JOIN Inscripciones i ON c.IDClase = i.IDClase
    WHERE i.Cancelada = 0
    GROUP BY a.IDActividad, a.Nombre
    ORDER BY CantidadAlumnos DESC;
END
GO

