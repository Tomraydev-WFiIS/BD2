USE AdventureWorks
GO

--- Skrypt Lab02.17
WITH EmployeeManager AS(
	SELECT
		FirstName+' '+LastName as Employee,
		FirstName+' '+LastName as Manager,
		ManagerID, EmployeeID, 0 AS EmployeeLevel
	FROM HumanResources.Employee
	JOIN Person.Contact ON HumanResources.Employee.ContactID=Person.Contact.ContactID
WHERE ManagerID IS NULL
UNION ALL
SELECT
	FirstName+' '+LastName as Employee,
	man.Employee as Manager,
	emp.ManagerID, emp.EmployeeID,
	man.EmployeeLevel+1 AS EmployeeLevel
FROM HumanResources.Employee emp
JOIN Person.Contact ON emp.ContactID=Person.Contact.ContactID
JOIN EmployeeManager man ON emp.ManagerID=man.EmployeeID
)
SELECT Employee, Manager FROM EmployeeManager WHERE EmployeeLevel < 4
ORDER BY Employee