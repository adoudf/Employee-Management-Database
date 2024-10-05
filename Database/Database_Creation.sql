CREATE TABLE Employee
( 
	employeeIdNumber     char(5)  NOT NULL ,
	lastName             char(5)  NULL ,
	firstName            char(5)  NULL ,
	middleInitial        char(1)  NULL ,
	Street               char(15)  NULL ,
	City                 char(8)  NULL ,
	State                char(2)  NULL ,
	postalCode           int  NULL ,
	Sex                  char(1)  NULL ,
	dateOfBirth          date  NULL ,
	PRIMARY KEY  CLUSTERED (employeeIdNumber ASC)
)
go

CREATE TABLE Job
( 
	jobCode              char(4)  NOT NULL ,
	jobTitle             char(14)  NULL ,
	minimumSalary        money  NULL ,
	maximuimSalary       money  NULL ,
	PRIMARY KEY  CLUSTERED (jobCode ASC)
)
go

CREATE TABLE Department
( 
	departmentCode       int  NOT NULL ,
	departmentName       char(30)  NULL ,
	Budget               money  NULL ,
	PRIMARY KEY  CLUSTERED (departmentCode ASC)
)
go

CREATE TABLE JobHistory
( 
	employeeIdNumber     char(5)  NOT NULL ,
	jobCode              char(4)  NOT NULL ,
	startDateOfJob       date  NULL ,
	endDateOfJob         date  NULL ,
	departmentCode       int  NULL ,
	PRIMARY KEY  CLUSTERED (employeeIdNumber ASC,jobCode ASC),
	 FOREIGN KEY (employeeIdNumber) REFERENCES Employee(employeeIdNumber),
	 FOREIGN KEY (jobCode) REFERENCES Job(jobCode),
	 FOREIGN KEY (departmentCode) REFERENCES Department(departmentCode)
)
go

CREATE TABLE WorkStatus
( 
	statusCode           char(1)  NOT NULL ,
	statusDescription    char(10)  NULL ,
	PRIMARY KEY  CLUSTERED (statusCode ASC)
)
go

CREATE TABLE SalaryHistory
( 
	employeeIdNumber     char(5)  NOT NULL ,
	jobCode              char(4)  NOT NULL ,
	startDateOfSalary    date  NOT NULL ,
	salaryAmount         money  NULL ,
	endDateOfSalary      date  NULL ,
	statusCode           char(1)  NULL ,
	PRIMARY KEY  CLUSTERED (employeeIdNumber ASC,jobCode ASC,startDateOfSalary ASC),
	 FOREIGN KEY (employeeIdNumber,jobCode) REFERENCES JobHistory(employeeIdNumber,jobCode),
	 FOREIGN KEY (statusCode) REFERENCES WorkStatus(statusCode)
)
go

