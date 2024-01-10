USE AdventureWorks2022

--Zad1
BEGIN TRANSACTION

UPDATE Production.Product
SET ListPrice=ListPrice*1.1
WHERE ProductID = 680

COMMIT TRANSACTION

--Zad2
BEGIN TRANSACTION
INSERT INTO Production.Product(Name,  color, StandardCost, ListPrice,ProductNumber, SafetyStockLevel, ReorderPoint, DaysToManufacture, SellStartDate)
VALUES ('New product', 'Czarny', 15.00, 25.00, 'NW002',  50, 5, 5,21-11-2022);
COMMIT TRANSACTION

SELECT Name, ProductID
FROM Production.Product
WHERE Name = 'New product';
--zad3
BEGIN TRANSACTION
DELETE FROM Production.Product
WHERE ProductID=1003

COMMIT TRANSACTION

--Zad4
BEGIN TRANSACTION;

DECLARE @TotalCost DECIMAL(20, 2);
SELECT @TotalCost = SUM( StandardCost * 1.1)
FROM Production.Product;

IF @TotalCost <=50000
BEGIN
UPDATE Production.Product
SET StandardCost=StandardCost *1.1;

COMMIT TRANSACTION;
END
ELSE
BEGIN
ROLLBACK TRANSACTION;
END

SELECT SUM(StandardCost)
FROM Production.Product;

--zad5
BEGIN TRANSACTION
DECLARE @TOTALPRODUCT INT;

 SELECT @TOTALPRODUCT=COUNT(*)
 FROM Production.Product
 WHERE Name='New product';
 IF @TOTALPRODUCT > 0
 BEGIN
 ROLLBACK TRANSACTION;
 END
 ELSE 
 BEGIN
 INSERT INTO Production.Product (Name, Color, StandardCost, ListPrice, ProductNumber, SafetyStockLevel, ReorderPoint, DaysToManufacture, SellStartDate)
VALUES ('New product', 'Czarny', 15.00, 25.00, 'NW001', 50, 5, 6,21-11-2022);
COMMIT TRANSACTION;
END


SELECT Name, ProductID
FROM Production.Product
WHERE Name='New prodcut';

--zad6
BEGIN TRANSACTION
UPDATE Sales.SalesOrderDetail
SET OrderQty =8 WHERE OrderQty <> 0
Declare @ROWS INT
IF @ROWS = (SELECT COUNT(*) FROM Sales.SalesOrderDetail WHERE OrderQty=0)
BEGIN
ROLLBACK TRANSACTION
END
ELSE
BEGIN
COMMIT TRANSACTION
END

--zad7
BEGIN TRANSACTION
DECLARE @AVERAGE FLOAT
DECLARE @AVERAGEPROD FLOAT

SELECT @AVERAGE = avg(StandardCost) FROM Production.Product
UPDATE Production.Product
 SET @AVERAGE = StandardCost
 WHERE  StandardCost > @AVERAGE;

 SELECT @AVERAGEPROD = @@ROWCOUNT;--@@ROWCOUNT zmienna przechowujaca ilosc wierszy ktore bu³y wczesniej zaktualizowane

 IF @AVERAGEPROD > 200
 BEGIN 
 ROLLBACK TRANSACTION;
 END
 ELSE
 BEGIN
 COMMIT TRANSACTION;
 END



