CREATE VIEW vCurrentJob59
	AS SELECT FirstName ,LastName,JobTitle
    From Employee join JobHistory on Employee.employeeIdNumber = JobHistory.employeeIdNumber
                  join job on JobHistory.jobCode = Job.jobCode	
