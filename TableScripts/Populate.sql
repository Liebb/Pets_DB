USE PETS_DB
GO
INSERT INTO [Security].[Rol] (
    [Name], 
    RolInfo) 
VALUES
    ('Admin', 'Rol que se encarga de administrar el sistema.'),
    ('Secretary', 'Administra las citas y solicitudes.'),
    ('Client', 'Usuario que interactúa con el sistema.');
GO
INSERT INTO [Person].[Salary] (
    [Quantity])
VALUES
    (6000),
    (7000),
    (8000);
GO
INSERT INTO [Person].[Person] (
    [Names],
    Surnames,
    Telephone,
    City,
    Addres,
    Birthdate,
    AuditCreateUser
    )
VALUES
    ('Samuel Elías', 'Solórzano Obando', 78907654, 'Managua', 'El arbolito 2 al lago', '2002-10-12',1),
    ('Abel  Antonio', 'Calero Flores', 78907653, 'Managua', 'El arbolito 2 al lago', '2002-10-12', 1),
    ('Ricardo Antonio', 'Rodriguez Borge', 78907652, 'Managua', 'El arbolito 2 al lago', '2002-10-12', 1)
GO
INSERT INTO [Person].[Employee] (
  IdRol,
  IdSalary,
  InssNumber,
  AuditCreateUser
    )
VALUES
    (1, 3, 123456789012,1),
    (2, 1, 123456789013,1)
GO
INSERT INTO [Account].[User] (
    IdPerson,
    IdRol,
    Email,
    [Password],
    AuditCreateUser
    )
VALUES
    (1, 1, 'samuelsol@gmail.com', 'samuel123',1),
    (3, 3, 'ricardorod@gmail.com', 'ricardo123',1)
GO
INSERT INTO [Account].Request (
    IdUser,
    Reason,
    HouseDeed
    )
VALUES
    (1, 'Deseo adoptar un compañero de vida', '2023-01-25')
GO
INSERT INTO [Account].[Date] (
    IdUser,
    [Date]
    )
VALUES
    (2, GETDATE())
GO
INSERT INTO [Pet].Breeds (
    BreedName,
    InfoBreeds,
    AuditCreateUser
    )
VALUES
    ('Pastor alemán', 'Se trata de un perro bien proporcionado. La cabeza es ancha y se estrecha con gracia en un hocico afilado.',1)
GO
INSERT INTO [Pet].Dogs (
    IdBreed,
    DogName,
    Birthdate,
    Color,
    Gender,
    AuditCreateUser
    )
VALUES
    (1,'Luna', '2021-10-20', 'Cafe castaño', 1,1)

GO
SELECT * FROM [Security].[Rol];
SELECT * FROM  [Account].[Date];
SELECT * FROM [Account].Request;
SELECT * FROM [Pet].Dogs;
SELECT * FROM [Pet].Breeds;
SELECT * FROM [Security].Connection;
SELECT * FROM[Account].[User];
SELECT * FROM [Person].Employee;
SELECT * FROM [Person].Salary;
SELECT * FROM [Person].Person;