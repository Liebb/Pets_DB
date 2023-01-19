USE
PETS_DB
GO
CREATE PROCEDURE Get_Dogs AS
    SELECT * 
        FROM [Pet].Dogs
GO;
EXEC Get_Dogs

SELECT IdDogs, [Name], Color, Birthdate, Gender, [Name], InfoBreeds FROM [Pet].Dogs JOIN [Pet].[Breeds] 
    ON [Pet].Dogs.IdBreed =  [Pet].[Breeds].IdBreed