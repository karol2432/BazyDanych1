USE AdventureWorks2022; -- U¿yj bazy danych AdventureWorks
/*
-- Tworzenie tabeli tymczasowej TempEmployeeInfo
WITH EmployeeInfoCTE AS (
    SELECT 
        e.BusinessEntityID,
        p.FirstName,
        p.LastName,
        e.JobTitle,
        e.BirthDate,
        e.Gender,
        ra.Rate,
        ra.PayFrequency
    FROM 
        HumanResources.Employee AS e
    INNER JOIN 
        Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID
    INNER JOIN 
        HumanResources.EmployeePayHistory AS eph ON e.BusinessEntityID = eph.BusinessEntityID
    INNER JOIN 
        HumanResources.EmployeePayHistory AS ra ON eph.RateChangeDate = ra.RateChangeDate
)
SELECT 
    BusinessEntityID,
    FirstName,
    LastName,
    JobTitle,
    BirthDate,
    Gender,
    Rate,
    PayFrequency
INTO 
    TempEmployeeInfo -- Zapis do tabeli tymczasowej TempEmployeeInfo
FROM 
    EmployeeInfoCTE;

-- Wyœwietlenie danych z tabeli tymczasowej
SELECT * FROM TempEmployeeInfo;
*/
--2--
/*
USE AdventureWorks2022; -- U¿yj bazy danych AdventureWorks

WITH SalesInfoCTE AS (
    SELECT 
        CONCAT(c.CompanyName, ' (', p.FirstName, ' ', p.LastName, ')') AS CompanyContact,
        SUM(soh.TotalDue) AS Revenue
    FROM 
        AdventureWorksLT2022.SalesLT.Customer AS c
    INNER JOIN 
        AdventureWorksLT2022.SalesLT.SalesOrderHeader AS soh ON c.CustomerID = soh.CustomerID
    INNER JOIN 
        AdventureWorks2022.HumanResources.Employee AS e ON c.CustomerID = e.BusinessEntityID
    INNER JOIN 
        AdventureWorks2022.Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID
    GROUP BY 
        c.CompanyName, p.FirstName, p.LastName
)
SELECT 
    CompanyContact,
    Revenue
FROM 
    SalesInfoCTE;
	*/
	--3--
	USE AdventureWorksLT2022; -- U¿yj bazy danych AdventureWorksLT

WITH CategorySalesCTE AS (
    SELECT 
        pc.Name AS Category,
        SUM(sod.LineTotal) AS SalesValue
    FROM 
        SalesLT.SalesOrderDetail AS sod
    INNER JOIN 
        SalesLT.Product AS p ON sod.ProductID = p.ProductID
    INNER JOIN 
        SalesLT.ProductCategory AS pc ON p.ProductCategoryID = pc.ProductCategoryID
    GROUP BY 
        pc.Name
)
SELECT 
    Category,
    SalesValue
FROM 
    CategorySalesCTE;


