USE
PETS_DB
GO
--Simulando un get de perros
CREATE PROCEDURE Get_Dogs AS
    SELECT IdDogs, DogName, Color, Birthdate, Gender,BreedName , InfoBreeds 
        FROM [Pet].Dogs JOIN [Pet].[Breeds] 
            ON [Pet].Dogs.IdBreed =  [Pet].[Breeds].IdBreed
    GO
EXEC Get_Dogs
GO 
--POST DE DOGS
CREATE PROCEDURE Post_Dogs 
    @IdBreed int, @DogName varchar(20), @Birthdate date,
    @Color varchar(15), @Gender bit, @Sickness int, @AuditCreateUser int 
        AS 
INSERT INTO [Pet].Dogs (
    IdBreed,
    DogName,
    Birthdate,
    Color,
    Gender,
    Sickness,
    AuditCreateUser
    )
VALUES
    ( @IdBreed,@DogName, @Birthdate, @Color, @Gender, @Sickness, @AuditCreateUser);
EXEC Post_Dogs @IdBreed = 1 ,@DogName = 'Vayne', @Birthdate = '2022-10-04', @Color = 'Marrón', @Gender = 1, @Sickness = 0, @AuditCreateUser =1
GO
--GET DE USERS
CREATE PROCEDURE Get_Users AS
    SELECT  Names, Surnames, Telephone, City, Addres, Birthdate, Email, [Password], Avatar, [Name]
        FROM [Account].[User] 
            JOIN [Person].Person ON [Account].[User].IdPerson = [Person].Person.IdPerson
            JOIN [Security].[Rol] ON [Account].[User] .IdRol = [Security].[Rol].[IdRol]
GO
EXEC Get_Users
GO
--Post de persona (OJO FALTA EL CAMPO DE AUDITORÍA)
CREATE PROCEDURE Post_Person
    @Names varchar(50), @Surnames varchar(50), @Telephone char(9), @City varchar(30),
    @Addres varchar(150), @Birthdate date
        AS 
INSERT INTO [Person].Person (
    Names,
    Surnames,
    Telephone,
    City,
    Addres,
    Birthdate
    )
VALUES (@Names, @Surnames, @Telephone , @City, @Addres, @Birthdate);
GO
--Post de Empleado
CREATE PROCEDURE Post_Employee
    @IdRol int, @IdSalary int, @InssNumber varchar(12)
        AS 
INSERT INTO [Person].Employee (
    IdRol, 
    IdSalary,
    InssNumber
    )
VALUES (@IdRol, @IdSalary, @InssNumber);

GO
--Post de Empleado
CREATE PROCEDURE Post_User
    @IdPerson int, @IdRol int, @Email varchar(30), @Password varchar(30)
        AS 
INSERT INTO [Person].Employee (
    IdPerson,
    IdRol, 
    IdSalary,
    InssNumber
    )
VALUES (@IdPerson, @IdRol, @Email, @Password);