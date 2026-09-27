-- Задание 1
CREATE TABLE TestTable (
    ID INT IDENTITY(1,1) NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Description VARCHAR(100) NOT NULL,
    CreatedDate DATETIME NOT NULL,
    Amount DECIMAL(10,2) NOT NULL
);
GO

SET NOCOUNT ON;
INSERT INTO TestTable (Name, Description, CreatedDate, Amount)
SELECT TOP 1000000
    'Name_' + CAST(ABS(CHECKSUM(NEWID())) AS VARCHAR(20)),
    'Desc_' + CAST(ABS(CHECKSUM(NEWID())) AS VARCHAR(20)),
    DATEADD(day, ABS(CHECKSUM(NEWID())) % 365, '2020-01-01'),
    ABS(CHECKSUM(NEWID())) % 10000
FROM sys.all_objects a
CROSS JOIN sys.all_objects b;
GO

-- Задание 2
SET STATISTICS IO ON;
GO

-- Задание 3
SELECT * FROM TestTable WHERE ID = 500000;
GO

-- Задание 4
CREATE CLUSTERED INDEX IX_TestTable_ID ON TestTable(ID);
GO

-- Задание 5
SELECT * FROM TestTable WHERE ID = 500000;
GO
