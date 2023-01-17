USE PETS_DB
GO
 DROP TABLE Pet.Breed;

-- CREATE TABLE Pet.Breed(
--     BreedID int IDENTITY(1,1) NOT NULL
--         CONSTRAINT PK_Breed_BreedID
--             PRIMARY KEY CLUSTERED, 
--     BreedName varchar(50) NOT NULL 
-- );

CREATE TABLE Pet.Breed(
    BreedID int IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_Breed_BreedID
            PRIMARY KEY CLUSTERED, 
    BreedName varchar(50) NOT NULL
        CONSTRAINT UQ_Breeds_Breed 
            UNIQUE NONCLUSTERED
        CONSTRAINT CK_Breed_BreedName_MustNotBe_Empty
            CHECK(BreedName <>''), 
    [State] bit NOT NULL 
        CONSTRAINT DF_Breed_State_IsActive
            DEFAULT 1,
    Quantity int NOT NULl
        CONSTRAINT CK_Beed_Quantity_MustNotBe_Negative
            CHECK(1=Pet.CheckQuantity(Quantity))

);

INSERT INTO Pet.Breed(
    BreedName,
    Quantity
) VALUES('Bull dog', 0); 
SELECT * FROM Pet.Breed;
GO

CREATE FUNCTION Pet.CheckQuantity( @Quantity int ) RETURNS bit 
AS BEGIN 
    RETURN(IIF (@Quantity >= 1, 1, 0))
END