USE MASTER 
GO
CREATE DATABASE PETS_DB
--Muestra información general de la base de dataos
USE PETS_DB
SELECT * FROM sys.databases WHERE [name] = 'PETS_DB';

--SP que muestra la ruta de la DB para los logs y para la data
EXEC sp_helpfile;
GO

CREATE SCHEMA Account
    AUTHORIZATION dbo; 
GO
USE PETS_DB
Go
CREATE SCHEMA [Security]
    AUTHORIZATION dbo;
GO
CREATE SCHEMA Pet
    AUTHORIZATION dbo;
GO
CREATE SCHEMA Person
    AUTHORIZATION dbo;
GO

ALTER DATABASE PETS_DB
    ADD FILEGROUP PetsData;
ALTER DATABASE PETS_DB
    ADD FILE (
       NAME = PetsData,
       FILENAME = 'C:\SQLFiles\PetsDB\PetsData.mdf'
    )
    TO FILEGROUP PetsData;
 
ALTER DATABASE PETS_DB
    ADD LOG FILE ( 
        NAME = PetsLogs,
        FILENAME = 'C:\SQLFiles\PetsDB\PetsLog.ldf'
    );

DROP DATABASE PETS_DB;