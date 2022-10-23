
Create Table Location
( Location_ID int primary key
,City Varchar(50)
)

Create Table Department
( Department_Id int Primary Key
, Name Varchar(50)
, Location_Id int foreign key references Location(Location_ID) 
)

Create Table JOB
( Job_ID int primary key
, Designation Varchar(50)
)

Create Table Employee
(    Employee_ID int primary key
	,Last_Name varchar(30)
	,First_Name varchar(30)
	,Middle_Name varchar(30)
	,Job_id Int foreign key references Job(Job_id) 
	,Manager_id int 
	,Hire_Date Date
	,Salary int 
	,Comm int 
	,Department_ID int foreign key references Department(Department_Id)
)

Insert Into Location(Location_ID,City)
Select '122' , 'New York' Union all
Select '123' , 'Dallas' Union all
Select '124' , 'Chicago' Union all
Select '167' , 'Boston' 

Insert Into Department(Department_Id,Name,Location_Id)
Select '10','Accounting','122' Union All
Select '20','Sales','124' Union All
Select '30','Research','123' Union All
Select '40','Operations','167'

Drop table Department
Drop table Employee

Insert Into JOB(Job_ID, Designation)
Select '667', 'Clerk' Union All
Select '668', 'Staff' Union All
Select '669', 'Analyst' Union All
Select '670', 'Sales Person' Union All
Select '671', 'Manager' Union All
Select '672', 'President'

Insert Into Employee(Employee_ID,Last_Name,First_Name,Middle_Name,Job_id,Manager_id,Hire_Date,Salary,Comm,Department_ID)
Select '7369','SMITH','JOHN','Q','667','7902','17-DEC-84','800',NULL,'20' Union all
Select '7499','ALLEN','KEVIN','J','670','7698','20-FEB-85','1600','300','30' Union all
Select '7505','DOYLE','JEAN','K','671','7839','04-APR-85','2850',NULL,'30' Union all
Select '7506','DENNIS','LYNN','S','671','7839','15-MAY-85',' 2750',NULL,'30' Union all
Select '7507','BAKER','LESLIE','D','671','7839','10-JUN-85','2200',NULL,'40' Union all
Select '7521','WARK','CYNTHIA','D','670','7698','22-FEB-85','1250','500','30' 

Select * from Employee

--SIMPLE QUERIES:

--1. LIST ALL THE EMPLOYEE DETAILS.

		Select *
		From Employee

--2. LIST ALL THE DEPARTMENT DETAILS

		Select *
		From Department

--3. LIST ALL JOB DETAILS.

		Select *
		From JOB

--4. LIST ALL THE LOCATIONS.

		Select *
		From Location

--5. LIST OUT THE FIRSTNAME, LASTNAME, SALARY, COMMISSION FOR ALL EMPLOYEES.

		Select First_name as Firstname, last_name as Lastname, Salary as salary, Comm as Commission 
		From Employee

--6. LIST OUT EMPLOYEEID,LAST NAME, DEPARTMENT ID FOR ALL EMPLOYEES AND ALIAS 
    --EMPLOYEEID AS "ID OF THE EMPLOYEE", LAST NAME AS "NAME OF THE EMPLOYEE", 
    --DEPARTMENTID AS "DEP_ID".

		Select emp.Employee_ID as ID, emp.Last_Name as 'Name of the Employee', emp.Department_ID as Dep_ID
		From Employee as emp

--7. LIST OUT THE EMPLOYEES ANNUAL SALARY WITH THEIR NAMES ONLY.

		Select Salary as AnnualSalary, CONCAT(First_name,' ',Middle_Name,' ',Last_Name) as FullName
		From Employee

--WHERE CONDITION:

--1. LIST THE DETAILS ABOUT "SMITH"
		
		Select * From Employee
		where Last_name = 'SMITH'
		
--2. LIST OUT THE EMPLOYEES WHO ARE WORKING IN DEPARTMENT 20.

		Select *
		From Employee
		where Department_ID = 20

--3. LIST OUT THE EMPLOYEES WHO ARE EARNING SALARY BETWEEN 1500 AND 2500.

		Select *
		From employee
		where Salary between 1500 and 2500

--4. LIST OUT THE EMPLOYEES WHO ARE WORKING IN DEPARTMENT 10 OR 20.

		Select *
		From Employee
		where Department_id = 10 
		or Department_id = 20
			
--5. FIND OUT THE EMPLOYEES WHO ARE NOT WORKING IN DEPARTMENT 10 OR 30.

		Select *
		From Employee
		Where department_id not in (10,30)

--6. LIST OUT THE EMPLOYEES WHOSE NAME STARTS WITH 'S'.

		Select * 
		From employee
		where last_name like 'S%'

--7. LIST OUT THE EMPLOYEES WHOSE NAME STARTS WITH 'S' AND ENDS WITH 'H'.

		Select *
		From Employee
		Where Last_name like 'S%h'

--8. LIST OUT THE EMPLOYEES WHOSE NAME LENGTH IS 4 AND START WITH 'L'.

		Select *
		From employee
		where len(first_name) = 4 and first_name like 'L%'

--9. LIST OUT EMPLOYEES WHO ARE WORKING IN DEPARRTMENT 30 AND DRAW THE 
    --SALARIES MORE THAN 2500.

		Select *
		From Employee
		where Department_ID = 30 and Salary>=2500

--10. LIST OUT THE EMPLOYEES WHO ARE NOT RECEVING COMMISSION.

		Select * 
		From Employee
		where Comm is not null

--ORDER BY CLAUSE:

--1. LIST OUT THE EMPLOYEE ID, LAST NAME IN ASCENDING ORDER BASED ON THE EMPLOYEE ID.

		Select Employee_ID as ID , Last_Name as Lname
		From employee
		order by employee_ID asc

--2. LIST OUT THE EMPLOYEE ID, NAME IN DESCENDING ORDER BASED ON SALARY.

		Select employee_id, First_name, Salary
		From Employee
		Order by Salary desc

--3. LIST OUT THE EMPLOYEE DETAILS ACCORDING TO THEIR LAST-NAME IN ASCENDING ORDER

		Select *
		From employee
		order by last_name asc

--4. LIST OUT THE EMPLOYEE DETAILS ACCORDING TO THEIR LAST-NAME IN ASCENDING ORDER AND 
--THEN ON DEPARTMENT_ID IN DESCENDING ORDER

		Select *
		From Employee
		Order by Last_name asc, department_ID desc

  --GROUP BY & HAVING CLAUSE

--1. HOW MANY EMPLOYEES WHO ARE IN DIFFERENT DEPARTMENTS WISE IN THE ORGANIZATION.

		Select Count(Employee_ID) as Nofemployess, dep.Name
		from Employee as emp
		inner join Department as Dep on emp.Department_ID=dep.Department_ID
		group by Dep.name

--2. LIST OUT THE DEPARTMENT WISE MAXIMUM SALARY, MINIMUM SALARY, AVERAGE SALARY OF 
  --THE EMPLOYEES.

		Select dep.Name, max(Salary) as MaxSal, Min(Salary) as MinSal, Avg(Salary) as AVGSal
		from Employee as emp
		inner join Department as Dep on emp.Department_ID=dep.Department_ID
		group by Dep.name
		--having max(Salary) = (Select Max(Salary) from employee)

		Select *
		From employee

--3. LIST OUT JOB WISE MAXIMUM SALARY, MINIMUM SALARY, AVERAGE SALARIES OF THE 
  --EMPLOYEES.

		
		Select job.Designation, MAX(Salary) as MAXSAL, Min(Salary) as MINSAL, AVG(Salary) as AVGSAL
		From employee as emp
		inner join Job as Job on emp.job_ID = job.Job_ID
		Group by job.Designation

		Select *
		From Employee

--4. LIST OUT THE NUMBER OF EMPLOYEES JOINED IN EVERY MONTH IN ASCENDING ORDER.

		Select FORMAT(Hire_date,'MMM') as HireMonth, Count(Employee_ID) as Employees
		From Employee
		Group by FORMAT(Hire_date,'MMM')
		Order by HireMonth Asc
		
		Select *
		From Employee
		Order by Hire_Date

--5. LIST OUT THE NUMBER OF EMPLOYEES FOR EACH MONTH AND YEAR, IN THE ASCENDING 
  --ORDER BASED ON THE YEAR, MONTH.
		
		Select format(Hire_date,'Y') as month_Year, Count(employee_ID) as employees
		From Employee
		Group by format(Hire_date,'Y')
		Order by Month_year
		
		Select *
		From Employee

--6. LIST OUT THE DEPARTMENT ID HAVING ATLEAST FOUR EMPLOYEES.

		Select Department_ID, COunt(Employee_ID) as Emp
		From Employee
		Group by Department_ID
		Having COunt(Employee_ID) >= 4

--7. HOW MANY EMPLOYEES JOINED IN APR MONTH.

		Select Format(Hire_date,'MMM') as Month, count(Employee_ID) as EMP
		From employee
		Group by Format(Hire_date,'MMM') 
		Having Format(Hire_date,'MMM') = 'Apr'

--8. HOW MANY EMPLOYEES JOINED IN APR OR FEB MONTH.

		Select Format(Hire_date,'MMM') as Month, count(Employee_ID) as EMP
		From employee
		Group by Format(Hire_date,'MMM') 
		Having Format(Hire_date,'MMM') = 'Apr'
				or Format(Hire_date,'MMM') = 'Feb'
		
--9. HOW MANY EMPLOYEES WERE JOINED IN 1985?

		Select right(Format(Hire_date,'Y'),4) as Year, count(Employee_ID) as EMP
		From employee
		Group by right(Format(Hire_date,'Y'),4) 
		Having right(Format(Hire_date,'Y'),4) = '1985'
		
--10. HOW MANY EMPLOYEES WERE JOINED EACH MONTH IN 1985.


		Select Format(Hire_date,'Y') as month, count(Employee_ID) as EMP
		From employee
		Group by Format(Hire_date,'Y')
		Having right(Format(Hire_date,'Y'),4) = '1985'

--11. HOW MANY EMPLOYEES WERE JOINED IN Feb 1985?

		Select Format(Hire_date,'Y') as month, count(Employee_ID) as EMP
		From employee
		Group by Format(Hire_date,'Y')
		Having Format(Hire_date,'Y') = 'February 1985'


--12. WHICH IS THE DEPARTMENT ID, HAVING GREATER THAN OR EQUAL TO 3 EMPLOYEES JOINED IN 
  --APRIL 1985?

		Select count(Department_ID) as CountDept, department_id--, year(hire_date)
		From Employee
		where year(hire_date) = '1985'
		group by department_iD
		having count(Department_ID) >= 3
				

		Select *
		From Employee
----JOINS

--1. LIST OUT EMPLOYEES WITH THEIR DEPARTMENT NAMES.

		Select emp.*, dep.Name as Dept_Names
		From Employee as emp
		inner join department as dep on emp.department_id = dep.department_id

--2. DISPLAY EMPLOYEES WITH THEIR DESIGNATIONS.

		Select emp.*, job.Designation as Designation
		From employee as emp
		inner Join job as job on emp.job_id = job.job_id

--3. DISPLAY THE EMPLOYEES WITH THEIR DEPARTMENT NAMES AND REGIONAL GROUPS.

		Select emp.*, dep.Name as Dept_Names, loc.City
		From Employee as emp
		inner join department as dep on emp.department_id = dep.department_id 
		Inner join location as loc on loc.Location_ID = dep.location_id 

--4. HOW MANY EMPLOYEES WHO ARE WORKING IN DIFFERENT DEPARTMENTS AND DISPLAY WITH 
    --DEPARTMENT NAMES.

			Select Count(emp.Employee_ID) as employees, dep.Name as Dept_Names
			From Employee as emp
			inner join department as dep on emp.department_id = dep.department_id 
			Group by dep.Name

--5. HOW MANY EMPLOYEES WHO ARE WORKING IN SALES DEPARTMENT.

			Select Count(emp.Employee_ID) as employees, dep.Name as Dept_Names
			From Employee as emp
			inner join department as dep on emp.department_id = dep.department_id 
			where dep.name = 'Sales'
			Group by dep.Name
			
--6. WHICH IS THE DEPARTMENT HAVING GREATER THAN OR EQUAL TO 4
    -- EMPLOYEES AND DISPLAY THE DEPARTMENT NAMES IN ASCENDING ORDER.

			Select Count(emp.Employee_ID) as employees, dep.Name as Dept_Names
			From Employee as emp
			inner join department as dep on emp.department_id = dep.department_id 
			Group by dep.Name
			Having count(emp.employee_id)>=4
			order by Dept_Names asc

--7. HOW MANY JOBS IN THE ORGANIZATION WITH DESIGNATIONS.

		Select count(employee_id) as employees, job.Designation
		From employee as emp
		inner join job as job on emp.job_id = job.Job_ID
		group by job.Designation


--8. HOW MANY EMPLOYEES ARE WORKING IN "boston".

		Select count(employee_id) as employees, loc.City
		From employee as emp
		inner join department as dept on emp.department_id = dept.department_id
		inner join location as loc on dept.location_id = loc.location_id
		where loc.city = 'Boston'
		group by loc.City

--9. DISPLAY THE EMPLOYEE DETAILS WITH SALARY GRADES.
		
		Select dept.name as DeptName , max(Salary) as maxSal, min(Salary) as MinSal, Avg(Salary) as AVGSal 
		From employee as emp
		inner join department as dept on emp.department_id = dept.department_id
		group by dept.name
		
--10. LIST OUT THE NO. OF EMPLOYEES ON GRADE WISE.

		Select dept.name as DeptName , max(Salary) as maxSal, 
		min(Salary) as MinSal, Avg(Salary) as AVGSal, count(employee_ID) as Noofemployees
		From employee as emp
		inner join department as dept on emp.department_id = dept.department_id
		group by dept.name


--11. DISPLAY THE EMPLOYEE SALARY GRADES AND NO. OF EMPLOYEES BETWEEN 1000 TO 
      --3000 RANGE OF SALARY.

		Select dept.name as DeptName , max(Salary) as maxSal, 
		min(Salary) as MinSal, Avg(Salary) as AVGSal, count(employee_ID) as Noofemployees
		From employee as emp
		inner join department as dept on emp.department_id = dept.department_id
		where salary between 1000 and 3000
		group by dept.name
		
--12. DISPLAY THE EMPLOYEE DETAILS WITH THEIR MANAGER NAMES.

		
		Create Table ManagerName
		( Manager_id int Primary key
		, Manager_Name varchar(30)
		)

		Insert into ManagerName(Manager_id,Manager_Name)
		Select '7902', 'Akash' union all
		Select '7698', 'Parul' union all
		Select '7839', 'Rajiv'
		

		Alter table employee
		Add constraint FK_Manager_iD
		foreign key (Manager_iD) references Managername(Manager_iD);

		Select emp.*, mn.Manager_Name 
		From employee as emp
		inner join ManagerName as MN on emp.manager_id = Mn.Manager_id


--13. DISPLAY THE EMPLOYEE DETAILS WHO EARN MORE THAN THEIR MANAGERS SALARIES.

		--Alter table managername
		--Add ManagerSalary int

		--Select *
		--From ManagerName

		--Update ManagerName
		--Set managersalary = '1000'
		--where Manager_Name = 'Parul'

		--Update ManagerName
		--Set managersalary = '2000'
		--where Manager_Name = 'Akash'

		--Update ManagerName
		--Set managersalary = '3000'
		--where Manager_Name = 'Rajiv'

		Select emp.*, mn.managersalary
		From Employee as emp
		inner join ManagerName as MN on emp.manager_id = mn.Manager_id
		where emp.salary < mn.managersalary


--14. SHOW THE NO. OF EMPLOYEES WORKING UNDER EVERY MANAGER.

		Select count(emp.employee_id) as employee, mn.Manager_Name
		From Employee as emp
		inner join ManagerName as MN on emp.manager_id = mn.Manager_id
		group by mn.Manager_Name


--15. DISPLAY EMPLOYEE DETAILS WITH THEIR MANAGER NAMES.

		Select emp.*, mn.Manager_Name
		From Employee as emp
		inner join ManagerName as MN on emp.manager_id = mn.Manager_id
		
--16. DISPLAY ALL EMPLOYEES IN SALES OR OPERATION DEPARTMENTS.
		
		Select emp.*, dept.Name as DeptName
		From Employee as emp
		inner join Department as dept on emp.department_id = dept.department_id
		where dept.Name = 'Sales' 
				or dept.name = 'Operations'

--SET OPERATORS
--1. LIST OUT THE DISTINCT JOBS IN SALES AND Research DEPARTMENTS.
		
		Select Job_ID
		From Employee
		where Department_id = (Select Department_ID from department where Name = 'Sales')
		Union 
		Select Job_ID
		from Job
		where job_id in 
		(select job_id from employee where Department_id = (Select Department_ID from department where Name = 'Research'))


--2. LIST OUT ALL THE JOBS IN SALES AND Research DEPARTMENTS.

		Select Job_ID
		From Employee
		where Department_id = (Select Department_ID from department where Name = 'Sales')
		Union All
		Select Job_ID
		from Job
		where job_id in 
		(select job_id from employee where Department_id = (Select Department_ID from department where Name = 'Research'))

		
--3. LIST OUT THE COMMON JOBS IN Sales AND Research DEPARTMENTS IN 
   -- ASCENDING ORDER.

		Select Job_ID
		From Employee
		where Department_id = (Select Department_ID from department where Name = 'Sales')
		Intersect
		Select Job_ID
		from Job
		where job_id in 
		(select job_id from employee where Department_id = (Select Department_ID from department where Name = 'Research'))
		order by Job_ID asc


--SUB QUERIES

--1. DISPLAY THE EMPLOYEES LIST WHO GOT THE MAXIMUM SALARY.

		Select *
		From Employee
		where Salary = (Select Max(Salary) from employee)

--2. DISPLAY THE EMPLOYEES WHO ARE WORKING IN SALES DEPARTMENT.
		
		Select *
		From Employee
		where department_ID = (Select Department_ID from Department where Name = 'Sales')

--3. DISPLAY THE EMPLOYEES WHO ARE WORKING AS 'CLERCK'.

		Select *
		From Employee
		where Job_ID = (Select Job_ID from Job where Designation = 'Clerk')

--4. DISPLAY THE LIST OF EMPLOYEES WHO ARE LIVING IN "Dallas".

		Select *
		From Employee
		where Department_ID = (Select Department_ID from Department
								where location_iD = (select location_id from location where City = 'Dallas'))

--5. FIND OUT NO. OF EMPLOYEES WORKING IN "SALES" DEPARTMENT.

		Select Count(Employee_ID) as Countofemployees
		From Employee
		where department_ID = (Select Department_ID from Department where Name = 'Sales')

--6. UPDATE THE EMPLOYEES SALARIES, WHO ARE WORKING AS CLERK ON THE BASIS OF 10%.
		
		Update Employee
		Set Salary = Salary+(Salary*10/100)
		where Job_ID = (Select Job_ID from Job where Designation = 'Clerk')

		Select *
		From Employee

--7. DELETE THE EMPLOYEES WHO ARE WORKING IN ACCOUNTING DEPARTMENT.

		Delete from employee 
		where Department_ID = (Select Department_ID from Department where Name = 'Accounting')

--8. DISPLAY THE SECOND HIGHEST SALARY DRAWING EMPLOYEE DETAILS.

		Select top 1 *
		From Employee
		Where Salary in (Select top 2 salary from employee order by salary desc)
		order by Salary asc

--9. DISPLAY THE N'TH HIGHEST SALARY DRAWING EMPLOYEE DETAILS.
			
			Select *
			From ( Select First_name, Salary, DENSE_RANK() over (order by salary desc) r 
					from employee) as x
			where r = n;

			-- put the number in n to get the salary for example n =2 for second highest salary


--10. LIST OUT THE EMPLOYEES WHO EARN MORE THAN EVERY EMPLOYEE IN DEPARTMENT 30.

		Select *
		From Employee
		Where Salary >= (Select max(Salary) from employee where department_ID = '30')

--11. LIST OUT THE EMPLOYEES WHO EARN MORE THAN THE LOWEST SALARY IN DEPARTMENT 30.

		Select *
		From Employee
		Where Salary >= (Select min(Salary) from employee where department_ID = '30')

--12. FIND OUT WHOSE DEPARTMENT HAS NOT EMPLOYEES.

		Select *
		From employee emp
		Where not exists (Select Department_ID from Department D where D.Department_ID = emp.department_ID)

--13. FIND OUT WHICH DEPARTMENT DOES NOT HAVE ANY EMPLOYEES.

		Select *
		From employee emp
		Where not exists (Select Department_ID from Department D where D.Department_ID = emp.department_ID)

--14. FIND OUT THE EMPLOYEES WHO EARN GREATER THAN THE AVERAGE SALARY FOR THEIR 
    ----DEPARTMENT

		Select * 
		From Employee emp
		where Salary >= (Select AVG(Salary) from employee)
