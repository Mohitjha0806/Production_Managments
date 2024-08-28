--    CREATE TABLE ProductMaster (
--    ProductID INT PRIMARY KEY IDENTITY(1,1),
--    ProductName NVARCHAR(100) NOT NULL
--   );

Select * from ProductMaster;
TRUNCATE TABLE DailyProduction;
TRUNCATE TABLE DailyProduction;
TRUNCATE TABLE ProductMaster;
TRUNCATE TABLE CompanyMaster;

Delete from ProductMaster where ProductID > 5;

Select * from ProductMaster;
Select * from DailyProduction;
Select * from CompanyMaster;


--  CREATE TABLE CompanyMaster (
--    CompanyID INT PRIMARY KEY IDENTITY(1,1),
--    CompanyName NVARCHAR(100) NOT NULL,
--    CompanyAddress NVARCHAR(200)
--  );


-- CREATE TABLE DailyProduction (
--    ProductionID INT PRIMARY KEY IDENTITY(1,1),
--    ProductID INT FOREIGN KEY REFERENCES ProductMaster(ProductID),
--    CompanyID INT FOREIGN KEY REFERENCES CompanyMaster(CompanyID),
--    ProductionDate DATE NOT NULL,
--    Quantity INT NOT NULL,
--    Shift NVARCHAR(50)
--  );


--  CREATE PROCEDURE Usp_InsertProductionData
--    @ProductName NVARCHAR(100),
--    @CompanyName NVARCHAR(100),
--    @CompanyAddress NVARCHAR(200),
--    @ProductionDate DATE,
--    @Quantity INT,
--    @Shift NVARCHAR(50)
-- AS
-- BEGIN
--    DECLARE @ProductID INT, @CompanyID INT;

--    -- Insert into ProductMaster
--    INSERT INTO ProductMaster (ProductName)
--    VALUES (@ProductName);
--    SET @ProductID = SCOPE_IDENTITY();

--    -- Insert into CompanyMaster
--    INSERT INTO CompanyMaster (CompanyName, CompanyAddress)
--    VALUES (@CompanyName, @CompanyAddress);
--    SET @CompanyID = SCOPE_IDENTITY();

--    -- Insert into DailyProduction
--    INSERT INTO DailyProduction (ProductID, CompanyID, ProductionDate, Quantity, Shift)
--    VALUES (@ProductID, @CompanyID, @ProductionDate, @Quantity, @Shift);
-- END;


--   CREATE PROCEDURE Usp_GetProductionData
--  AS
--   BEGIN
--    SELECT P.ProductName, C.CompanyName, C.CompanyAddress, D.ProductionDate, D.Quantity, D.Shift
--    FROM DailyProduction D
--    INNER JOIN ProductMaster P ON D.ProductID = P.ProductID
--    INNER JOIN CompanyMaster C ON D.CompanyID = C.CompanyID;
--   END;




--  ALTER PROCEDURE Usp_GetProductionData
--    @ProductName NVARCHAR(100) = NULL
--   AS
--   BEGIN
--    SELECT P.ProductName, C.CompanyName, C.CompanyAddress, D.ProductionDate, D.Quantity, D.Shift
--    FROM DailyProduction D
--    INNER JOIN ProductMaster P ON D.ProductID = P.ProductID
--    INNER JOIN CompanyMaster C ON D.CompanyID = C.CompanyID
--    WHERE (@ProductName IS NULL OR P.ProductName LIKE '%' + @ProductName + '%');
--  END;




Alter Proc usp_GetDashBoardData
AS
Begin
SELECT  top 5 PM.ProductName, SUM(Dp.Quantity)Quantity from  ProductMaster AS PM
Inner Join DailyProduction as DP On PM.ProductID = DP.ProductID
Group by ProductName
Order by Quantity

end;




INSERT INTO tblProducts (ProductName)
VALUES 
('Electric Fan'),
('Microwave Oven'),
('Refrigerator'),
('Washing Machine'),
('LED TV');

-- Inserting data into tblProductionDetails
INSERT INTO tblProductionDetails (Productiondate, ProductQuantity)
VALUES 
('2024-08-25', 150),
('2024-08-26', 200),
('2024-08-27', 180),
('2024-08-28', 220),
('2024-08-29', 170);

-- Additional records for 2023
INSERT INTO tblProductionDetails (Productiondate, ProductQuantity)
VALUES 
('2023-08-25', 150),
('2023-08-26', 200),
('2023-08-27', 180),
('2023-08-28', 220),
('2023-08-29', 170);

-- Stored Procedure to get product names
CREATE PROCEDURE usp_GetProductName
AS
BEGIN
    SELECT ProductName FROM tblProducts;
END;

-- Stored Procedure to get distinct production dates
CREATE PROCEDURE USP_GetDate
AS
BEGIN
    SELECT DISTINCT ProductionDate FROM tblProductionDetails;
END;

-- Stored Procedure to get product quantity based on the production date
CREATE PROCEDURE USP_GetProductQuantity
    @ProductionDate DATE
AS
BEGIN
    SELECT ProductQuantity 
    FROM tblProductionDetails
    WHERE ProductionDate = @ProductionDate;
END;


CREATE PROCEDURE USP_GetProductQuantityByDate
@ProductionDate DATE = NULL
AS
BEGIN
    SELECT P.ProductName, D.ProductQuantity 
    FROM tblProducts P
    JOIN tblProductionDetails D ON P.ProductID = D.ProductID
    WHERE D.ProductionDate = @ProductionDate;
END;


CREATE PROCEDURE USP_GetDistinctProductionDates
AS
BEGIN
    SELECT DISTINCT ProductionDate 
    FROM tblProductionDetails;
END;


SELECT * FROM tblProducts;
SELECT * FROM tblProductiondetails;



