CREATE TRIGGER JobUpdate59
on Job
For INSERT, UPDATE 
AS IF EXISTS
		(
			SELECT 'TRUE'
			FROM Job
			WHERE maximuimSalary < minimumSalary 
		)
		BEGIN
		RAISERROR('Minnimum salary for a job must be less than maximum salary',16,1)
		ROLLBACK TRANSACTION 
	END
