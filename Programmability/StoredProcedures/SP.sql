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
