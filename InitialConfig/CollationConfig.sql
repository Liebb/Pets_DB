-- Mostrar la configuración de collation de la instancia
USE PETS_DB
SELECT SERVERPROPERTY('collation') AS DefaultInstanceCollationName;

-- Mostrar la collation configurada en la base de datos
SELECT DATABASEPROPERTYEX(DB_NAME(), 'collation') AS DatabaseCollationName;

--Muestra todas las collations
SELECT name, description 
    FROM sys.fn_helpcollations()
GO
-- Mostrar las collations que no contienen 'LATIN'
SELECT name, description 
    FROM sys.fn_helpcollations()
    WHERE name LIKE N'SQL%' AND name not like N'SQL_Latin%';

--Cambiar la colletion de la BD
ALTER DATABASE PETS_DB
    COLLATE SQL_Latin1_General_CP1_CI_AS;
GO