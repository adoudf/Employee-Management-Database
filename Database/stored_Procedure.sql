CREATE PROCEDURE usp_jobInfo59
	@IdNumber CHAR(5)  
    AS select Employee.firstName, Employee.lastName, Department.departmentName, Job.jobTitle  
        From Employee JOIN JobHistory ON Employee.employeeIdNumber = JobHistory.employeeIdNumber  
                      JOIN Job ON JobHistory.jobCode = Job.jobCode  
                      JOIN Department ON Department.departmentCode = JobHistory.departmentCode  
            Where Employee.employeeIdNumber = @IdNumber AND endDateOfJob IS NULL

