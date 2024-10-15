CREATE TRIGGER SalaryUpdate59
on salaryHistory
For INSERT, UPDATE 
AS IF EXISTS
		(
			SELECT 'TRUE'
			FROM SalaryHistory
			WHERE startDateOfSalary > endDateOfSalary 
		)
		BEGIN
		RAISERROR('Start date of job must be before known end date of job',16,1)
		ROLLBACK TRANSACTION 
	END
