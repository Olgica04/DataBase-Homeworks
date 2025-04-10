use SEDC

DECLARE @FirstName nvarchar (50)
SET @FirstName = 'Aleksandar'

SELECT * FROM Employee
WHERE FirstName = @FirstName
GO

DECLARE @EmployeeDateBirth TABLE (EmployeeId int, FirstName nvarchar (100), DateOfBirth date)
INSERT INTO @EmployeeDateBirth (EmployeeId,FirstName,DateOfBirth)
SELECT Id,FirstName,DateOfBirth
FROM Employee
WHERE Gender = 'F'

SELECT * FROM @EmployeeDateBirth
GO

CREATE TABLE #EmployeeHireDate (LastName nvarchar(100), HireDate date)
INSERT INTO #EmployeeHireDate (LastName,HireDate)
SELECT Id,HireDate
FROM Employee
WHERE Gender = 'M' and FirstName like 'A%'

SELECT * FROM #EmployeeHireDate
GO

SELECT * 
FROM Employee
WHERE LEN (LastName) = 7
GO

CREATE FUNCTION fn_FormatProductName(@ProductId int)
RETURNS NVARCHAR(100)
AS
BEGIN

DECLARE @FunctionOutput nvarchar(100)
DECLARE @Description nvarchar(100)
DECLARE @Name nvarchar (50)
DECLARE @Price decimal (10,2)

SELECT 
	@Description = [Description],
	@Name = [Name],
	@Price = Price
FROM dbo.Product p
WHERE @ProductId = @ProductId

SET @FunctionOutput =
	SUBSTRING (@Description, 2, 2)+ '-' +
	RIGHT(@Name,3 )+'-'+
	CONVERT(nvarchar(100),@Price)

RETURN @FunctionOutput
END
GO
SELECT 
    p.* ,dbo.fn_FormatProductName(p.Id) AS FunctionOutput
FROM 
    dbo.Product p




