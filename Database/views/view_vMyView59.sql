CREATE VIEW vMyView59
	AS SELECT DISTINCT Employee.employeeIdNumber,
					   Employee.firstName,
					   Employee.lastName,
					   (SalaryHistory.salaryAmount* 0.175) AS IncomeTax,
					   (SalaryHistory.salaryAmount* 0.094) AS Insurance,
					   (SalaryHistory.salaryAmount* 0.06) AS Loans,
					   (SalaryHistory.salaryAmount - (SalaryHistory.salaryAmount* 0.175) - (SalaryHistory.salaryAmount* 0.094) - (SalaryHistory.salaryAmount* 0.06) ) AS TakeHomeSalary				  
				FROM Employee
    JOIN JobHistory ON Employee.employeeIdNumber = JobHistory.employeeIdNumber
    JOIN Job ON JobHistory.jobCode = Job.jobCode
    JOIN SalaryHistory ON JobHistory.employeeIdNumber = SalaryHistory.employeeIdNumber;
