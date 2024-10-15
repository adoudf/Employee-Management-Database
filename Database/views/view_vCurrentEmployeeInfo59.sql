CREATE VIEW vCurrentEmployeeInfo59
	AS SELECT DISTINCT Employee.employeeIdNumber,
					   Employee.firstName,
					   Employee.lastName,
					   (SalaryHistory.salaryAmount* 0.06) AS AdjustedSalary,
					   GETDATE() AS dateToday,
					   DATEDIFF(YEAR,employee.DateOfBirth, GETDATE()) AS employeeAge
				FROM Employee
    JOIN JobHistory ON Employee.employeeIdNumber = JobHistory.employeeIdNumber
    JOIN Job ON JobHistory.jobCode = Job.jobCode
    JOIN SalaryHistory ON JobHistory.employeeIdNumber = SalaryHistory.employeeIdNumber;
