USE PETS_DB
GO
DROP TABLE IF EXISTS 
    [Account].[Date],
    [Account].Request,
    [Pet].Dogs,
    [Pet].Breeds,
    [Security].Connection,
    [Account].[User],
    [Person].Employee,
    [Person].Salary,
    [Person].Person,
    [Security].Rol
GO
CREATE TABLE [Security].Rol(
    IdRol int IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_Rol_IdRol
        PRIMARY KEY CLUSTERED,
    [Name] varchar(30) NOT NULL 
        CONSTRAINT UQ_Rol_Name
        UNIQUE NONCLUSTERED,
    [Status] bit NOT NULL
        CONSTRAINT DF_State_IsActive
        DEFAULT 1,
    RolInfo VARCHAR(50) NULL
);
GO
CREATE TABLE [Person].Salary(
    IdSalary int IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_Salary_IdSalary
            PRIMARY KEY CLUSTERED,
    Quantity money NOT NULL,
    [Date] datetime default GETDATE()
);
GO
CREATE TABLE [Person].Person(
    IdPerson int IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_Person_IdPerson
        PRIMARY KEY CLUSTERED,
    Names VARCHAR(50) NOT NULL,
    Surnames VARCHAR(50) NOT NULL,
    Telephone CHAR(9) NOT NULL 
        CONSTRAINT UQ_Person_Telephone
        UNIQUE NONCLUSTERED,
    City VARCHAR(30) NOT NULL,
    Addres VARCHAR(150) NOT NULL, 
    Birthdate date NOT NULL,
    [State] int NOT NULL
    CONSTRAINT DF_Account_IsActive
        DEFAULT 1,
    AuditCreateUser int NOT NULL,
    AuditCreateDate datetime2(7) NOT NULL
        CONSTRAINT DF_Account_DefaultDate
            DEFAULT GETDATE(),
    AuditUpdateUser int NULL,
    AuditUpdateDate datetime2(7) NULL,
    AuditDeleteUser int NULL,
    AuditDeleteDate datetime2(7) NULL
);
GO
CREATE TABLE [Person].Employee(
    IdEmployee int IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_Employee_IdEmployee
        PRIMARY KEY CLUSTERED,
    IdRol int NOT NULL 
        CONSTRAINT FK_Employee_IdRol_Rol_IdRol
        FOREIGN KEY REFERENCES [Security].Rol (IdRol),
    IdSalary int NOT NULL 
        CONSTRAINT FK_Employee_IdSalary_Salary_IdSalary
        FOREIGN KEY REFERENCES [Person].Salary (IdSalary),
    InssNumber VARCHAR(12) NOT NULL
        CONSTRAINT UQ_Employee_InssNumber
        UNIQUE NONCLUSTERED,
   [State] int NOT NULL
    CONSTRAINT DF_Employee_IsActive
        DEFAULT 1,
    AuditCreateUser int NOT NULL,
    AuditCreateDate datetime2(7) NOT NULL
        CONSTRAINT DF_Employee_DefaultDate
            DEFAULT GETDATE(),
    AuditUpdateUser int NULL,
    AuditUpdateDate datetime2(7) NULL,
    AuditDeleteUser int NULL,
    AuditDeleteDate datetime2(7) NULL
);
GO
CREATE TABLE [Account].[User](
     IdUser int IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_User_IdUser
        PRIMARY KEY CLUSTERED,
    IdPerson int NOT NULL 
        CONSTRAINT FK_User_IdPerson_Person_IdPerson
        FOREIGN KEY REFERENCES [Person].Person (IdPerson),
    IdRol int NOT NULL 
        CONSTRAINT FK_User_IdRol_Rol_IdRol
        FOREIGN KEY REFERENCES [Security].Rol (IdRol),
    Email VARCHAR(30) NOT NULL 
        CONSTRAINT UQ_User_Email
        UNIQUE NONCLUSTERED,
    [Password] VARCHAR(100) NOT NULL,
    Avatar varchar (200) NOT NULL
        CONSTRAINT DF_User_Avatar_Image
            DEFAULT 'https://firebasestorage.googleapis.com/v0/b/lrs-tech-storage.appspot.com/o/default_avatar.png?alt=media&token=0710ac2a-3633-4a39-bc9e-151d0ecf26b3',
    AuditCreateUser int NOT NULL,
    AuditCreateDate datetime2(7) NOT NULL
        CONSTRAINT DF_User_DefaultDate
            DEFAULT GETDATE(),
    AuditUpdateUser int NULL,
    AuditUpdateDate datetime2(7) NULL,
    AuditDeleteUser int NULL,
    AuditDeleteDate datetime2(7) NULL
);
GO
CREATE TABLE [Account].Request(
    IdRequest int IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_Request_IdRequest
        PRIMARY KEY CLUSTERED,
    IdUser int NOT NULL
        CONSTRAINT FK_Request_IdUser_User_IdUser
            FOREIGN KEY REFERENCES [Account].[User] (IdUser),
    DateRequest datetime DEFAULT GETDATE() NOT NULL,
    Reason varchar(150) NOT NULL,
    HouseDeed varchar(150) NOT NULL,
    StateRequest int NOT NULL
    CONSTRAINT DF_Request_IsPending
        DEFAULT 0,
);
GO
CREATE TABLE [Account].[Date](
    IdDate int IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_AdoptionDate_IdAdoption
        PRIMARY KEY CLUSTERED,
    IdUser int NOT NULL
        CONSTRAINT FK_Date_IdUser_User_IdUser
            FOREIGN KEY REFERENCES [Account].[User] (IdUser),
    [State] int NOT NULL
        CONSTRAINT DF_Date_IsTrue
            DEFAULT 1,
    [Date] datetime not NULL,

);
GO
CREATE TABLE [Security].Connection (
    ConnectionID int IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_Connection_ConnectionID
            PRIMARY KEY CLUSTERED,
    Token varchar(300) NOT NULL,
    IpAddress varchar(15) NOT NULL,
    Browser varchar(30) NOT NULL,
    DeviceType varchar(15) NOT NULL,
    OperativeSystem varchar(30) NOT NULL,
    OperativeSystemVersion varchar(35) NOT NULL,
    IdPerson int NOT NULL
        CONSTRAINT FK_Connection_IdPerson_Person_IdPerson
            FOREIGN KEY REFERENCES [Person].Person (IdPerson),
    CreatedAt datetime2(7) DEFAULT GETDATE()
);
GO
CREATE TABLE[Pet].Breeds(
    IdBreed int IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_Breeds_IdBreed
            PRIMARY KEY CLUSTERED,
    [Name] varchar(20) NOT NULL 
        CONSTRAINT UQ_Breeds_Name
        UNIQUE NONCLUSTERED,
    [Status] int NOT NULL
    CONSTRAINT DF_Breeds_IsActive
        DEFAULT 1,
    InfoBreeds VARCHAR(150) NULL,
    AuditCreateUser int NOT NULL,
    AuditCreateDate datetime2(7) NOT NULL
        CONSTRAINT DF_Breeds_DefaultDate
            DEFAULT GETDATE(),
    AuditUpdateUser int NULL,
    AuditUpdateDate datetime2(7) NULL,
    AuditDeleteUser int NULL,
    AuditDeleteDate datetime2(7) NULL
);
GO
CREATE TABLE[Pet].Dogs(
    IdDogs int IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_Dogs_IdDogs
            PRIMARY KEY CLUSTERED,
    IdBreed int NOT NULL
        CONSTRAINT FK_Dogs_IdBreed_Breeds_IdBreed
        FOREIGN KEY REFERENCES [Pet].Breeds (IdBreed),
    Birthdate date NULL,
    Color varchar(15) NULL,
    Gender bit NOT NULL,
    Sickness int NOT NULL
    CONSTRAINT DF_Dogs_IsActive
        DEFAULT 1,
    AuditCreateUser int NOT NULL,
    AuditCreateDate datetime2(7) NOT NULL
        CONSTRAINT DF_Dogs_DefaultDate
            DEFAULT GETDATE(),
    AuditUpdateUser int NULL,
    AuditUpdateDate datetime2(7) NULL,
    AuditDeleteUser int NULL,
    AuditDeleteDate datetime2(7) NULL
);
