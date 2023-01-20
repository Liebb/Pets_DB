USE
PETS_DB
GO

--Simulando un get de perros
CREATE OR ALTER PROCEDURE [Pets].Get_Dogs AS
BEGIN
    SELECT IdDogs, DogName, Color, Birthdate, Gender,BreedName , InfoBreeds 
        FROM [Pet].Dogs JOIN [Pet].[Breeds] 
            ON [Pet].Dogs.IdBreed =  [Pet].[Breeds].IdBreed
    
END
EXEC [Pets].Get_Dogs
GO 

--POST DE DOGS
CREATE OR ALTER PROCEDURE [Pets].Post_Dogs 
    @IdBreed int, @DogName varchar(20), @Birthdate date,
    @Color varchar(15), @Gender bit, @Sickness int, @AuditCreateUser int 
    AS
BEGIN     
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
END

EXEC [Pets].Post_Dogs @IdBreed = 1 ,@DogName = 'Vayne', @Birthdate = '2022-10-04', @Color = 'Marrón', @Gender = 1, @Sickness = 0, @AuditCreateUser =1
GO


--GET DE USERS
CREATE OR ALTER PROCEDURE [Account].Get_Users AS
BEGIN
    SELECT  Names, Surnames, Telephone, City, Addres, Birthdate, Email, [Password], Avatar, [RolName]
        FROM [Account].[User] 
            JOIN [Person].Person ON [Account].[User].IdPerson = [Person].Person.IdPerson
            JOIN [Security].[Rol] ON [Account].[User] .IdRol = [Security].[Rol].[IdRol]
END
GO

EXEC [Account].Get_Users
GO


--Post de persona (OJO FALTA EL CAMPO DE AUDITORÍA)
CREATE OR ALTER PROCEDURE [Person].Post_Person
    @Names varchar(50), @Surnames varchar(50), @Telephone char(9), @City varchar(30),
    @Addres varchar(150), @Birthdate date,@AuditCreateUser int
AS
BEGIN 
    DECLARE @Id int;    
    INSERT INTO [Person].Person (
        Names,
        Surnames,
        Telephone,
        City,
        Addres,
        Birthdate,
        AuditCreateUser
        )
    VALUES (@Names, @Surnames, @Telephone , @City, @Addres, @Birthdate, @AuditCreateUser); 
    SET  @Id = SCOPE_IDENTITY();
    SELECT IdPerson FROM [Person].Person WHERE IdPerson = @Id;
END
GO
EXEC [Person].Post_Person 
    @Names = 'Juan Kevin', @Surnames = 'Lopez Molina' ,@Telephone = '76239087', @City = 'Managua',
    @Addres = 'Managua- Nicaragua', @Birthdate = '2022-10-20', @AuditCreateUser = 1;   
GO


--Post de Empleado
CREATE OR ALTER PROCEDURE [Person].Post_Employee
    @IdRol int, @IdSalary int, @InssNumber varchar(12)
        AS
BEGIN 
    INSERT INTO [Person].Employee (
        IdRol, 
        IdSalary,
        InssNumber
        )
    VALUES (@IdRol, @IdSalary, @InssNumber);
END
GO

--Post de Empleado
CREATE OR ALTER PROCEDURE [Account].Post_User
    @IdPerson int, @IdRol int, @Email varchar(30), @Password varchar(30)
        AS
BEGIN 
INSERT INTO [Person].Employee (
    IdPerson,
    IdRol, 
    IdSalary,
    InssNumber
    )
VALUES (@IdPerson, @IdRol, @Email, @Password);
END
GO
--Simulando un get de perros
CREATE OR ALTER PROCEDURE [Security].Get_Rols AS
BEGIN
    SELECT *
        FROM [Security].Rol  WHERE [Status] = 1
END
GO
EXEC [Security].Get_Rols