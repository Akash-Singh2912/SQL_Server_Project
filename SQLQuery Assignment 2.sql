Use SQLserver_21_08_2022

Create table Employee_Table
(
	Employee_ID int primary key
	,First_name varchar(50)
	,Last_Name varchar(50)
	,Salary int
	,Joining_date datetime
	,Department varchar(50)
)

Insert into Employee_Table(Employee_ID,First_name,Last_Name,Salary,Joining_date,Department)
Select 1,'Akash','Singh',1000,GETDATE()-1000,'HR' Union ALL
Select 2,'Parul','Aggarwal',2090,GETDATE()-2000,'Admin' Union ALL
Select 3,'Priya','Gupta',3400,GETDATE()-3000,'HR' Union ALL
Select 4,'Nihit','Garg',4030,GETDATE()-4000,'Admin' Union ALL
Select 5,'Nikhil','Mittal',5020,GETDATE()-5000,'Admin' Union ALL
Select 6,'Aditi','Kaushik',6080,GETDATE()-6000,'Account' Union ALL
Select 7,'Rajiv','Kumar',7250,GETDATE()-7000,'Account' Union ALL
Select 8,'Alka','Vaid',8025,GETDATE()-8000,'Admin'

Select * From Employee_Table

Create Table Employee_Bonus
(
	 Employee_ref_ID int FOREIGN KEY references Employee_Table (Employee_ID)
	 ,Bonus_Amount int
	 ,Bonus_Date datetime
)

Insert into Employee_Bonus(Employee_ref_ID,Bonus_Amount,Bonus_Date)
Select 1,5000,GETDATE()-500 union all
Select 2,3000,GETDATE()-600 union all
Select 3,4000,GETDATE()-700 union all
Select 1,4500,GETDATE()-800 union all
Select 2,3500,GETDATE()-900

Select * From Employee_Bonus

Create Table Employee_Tite
(
	Employee_ref_id int
	,employee_title varchar(50)
	,Affective_Date datetime
)

Insert into Employee_Tite(Employee_ref_id,employee_title,Affective_Date)
Select 1,'Manager',getdate()-600 union all
Select 2,'Executive',getdate()-700 union all
Select 8,'Executive',getdate()-700 union all
Select 5,'Manager',getdate()-700 union all
Select 4,'Assistant Manager',getdate()-700 union all
Select 7,'Executive',getdate()-700 union all
Select 6,'Lead',getdate()-700 union all
Select 3,'Lead',getdate()-700

Select * From Employee_Tite

----Task to be performed

--1. Display the “FIRST_NAME” from Employee table using the alias name 
     --as Employee_name.

	 Select First_Name as Employee_name
	 From Employee_Table

--2. Display “LAST_NAME” from Employee table in upper case.

	Select Upper(Last_name) as Last_name
	From Employee_Table

--3. Display unique values of DEPARTMENT from EMPLOYEE table.
	
	Select distinct(Department)
	From Employee_Table

--4. Display the first three characters of LAST_NAME from EMPLOYEE table.

	Select LEFT(last_name,3) as Last_name
	From Employee_Table

--5. Display the unique values of DEPARTMENT from EMPLOYEE table and 
     --prints its length.

	 Select distinct(Department),len(department) as dept_length 
	 From Employee_Table

--6. Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a 
     --single column AS FULL_NAME. 
     --a space char should separate them.

	 Select CONCAT(first_name,' ',last_name) as Full_name
	 From Employee_Table


--7. DISPLAY all EMPLOYEE details from the employee table 
     --order by FIRST_NAME Ascending.

	 Select *
	 From Employee_Table
	 order by first_name asc

--8. Display all EMPLOYEE details order by FIRST_NAME Ascending and 
     --DEPARTMENT Descending.

	 Select *
	 From Employee_Table
	 order by first_name asc, department desc

--9. Display details for EMPLOYEE with the first name as “Akash” and 
     ---“Alka” from EMPLOYEE table.

	 Select *
	 From Employee_Table
	 Where first_name = 'Akash'
	 or first_name = 'Alka';

--10. Display details of EMPLOYEE with DEPARTMENT name as “Admin”.

		Select *
		From Employee_Table
		Where Department = 'Admin'

--11 DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘v’.

		Select *
		from Employee_Table
		Where First_name like '%V%'

--12 DISPLAY details of the EMPLOYEES whose SALARY lies between 
     --1000 and 5000.

		 Select *
		 From Employee_Table
		 Where Salary between 1000 and 5000

--13 Display details of the employees who have joined in Dec-2019.

		Select * --, concat((Datepart(month,Joining_date)),'-',DATEPART(year,Joining_date)) AS DOJ
		From Employee_Table
		Where concat((Datepart(month,Joining_date)),'-',DATEPART(year,Joining_date)) = '12-2019'

--14 Display employee names with salaries >= 5000 and <= 8000.

		Select *
		From Employee_Table
		Where Salary BETWEEN 5000 AND 8000

--15 DISPLAY details of the EMPLOYEES who are also Managers.

		Select empt.Employee_ID,empt.First_name, ET.employee_title
		From Employee_Table as EmpT
		Inner join Employee_Tite as ET on ET.Employee_ref_id = EmpT.Employee_ID
		where employee_title = 'Manager'


--17 DISPLAY duplicate records having matching data in some fields of a 
  --table.

		Select First_name, count(Employee_ID) as CountEMP
		from Employee_Table
		Group by First_name
		Having count(Employee_ID)>1
		
--18 Display only odd rows from a table.

		Select *
		From Employee_Table
		where Employee_ID % 2 <> 0

--19 Clone a new table from EMPLOYEE table.

		Select *
		Into Employee_Table_Backup
		From Employee_Table

		Select * From Employee_Table_Backup

--20 DISPLAY the TOP 2 highest salary from a table.

		Select Top 2 *
		From Employee_Table
		order by Salary desc

--21. DISPLAY the list of employees with the same salary.

		Select Salary from (
		Select * , DENSE_RANK()Over(order by salary desc) as Rankvalue
		From Employee_Table
		) as x
		Group by Salary
		having count(*) >1

		Select * from Employee_Table
		where Salary = '1000'
		
--22 Display the second highest salary from a table.
				
		Select * from (
		Select * , DENSE_RANK()Over(order by salary desc) as Rankvalue
		From Employee_Table
		) as x
		where Rankvalue = 2
		
--23 Display the first 50% records from a table.

		Select top 50 PERCENT DENSE_RANK()Over(order by salary desc) as Rankvalue, *
		From Employee_Table
		

--24. Display the departments that have less than 4 people in it.

		Select Department, Count(Department) as Count
		From Employee_Table
		Group by Department
		Having Count(Department) < 4

--25. Display all departments along with the number of people in there.

		Select Department, Count(Department) as Count
		From Employee_Table
		Group by Department

--26 Display the name of employees having the highest salary in each 
   --department.
	
		Select * from (
		Select *, DENSE_RANK()over(partition by department order by salary desc) as rankvalue
		From Employee_Table
		) as X
		where rankvalue = 1

--27 Display the names of employees who earn the highest salary.
		
		Select Top 1 First_name, Last_Name, Salary
		From Employee_Table
		Order by Salary desc


--28 Diplay the average salaries for each department

		Select Department, Avg(Salary) As Avgsalary
		From Employee_Table
		Group by Department

--29 display the name of the employee who has got maximum bonus

		Select Top 1 EB.Bonus_Amount, Empt.First_name, Salary
		from Employee_Table as empt
		inner join Employee_Bonus as EB on EB.Employee_ref_id= Empt.Employee_ID
		Order by Bonus_Amount desc

--30 Display the first name and title of all the employees

		Select ET.employee_title, Empt.First_name
		from Employee_Table as empt
		inner join Employee_Tite as ET on ET.Employee_ref_id= Empt.Employee_ID