Use SQLserver_21_08_2022

Create Table STUDIES
( PNAME Varchar(50)
  ,INSTITUTE Varchar(100)
  ,COURSE Varchar(50)
  ,COURSE_FEE int
)

Insert Into STUDIES (PNAME,INSTITUTE,COURSE,COURSE_FEE)
Select 'ANAND', 'SABHARI', 'PGDCA', 4500 Union all
Select 'ALTAF', 'COIT', 'DCA', 7200 Union all
Select 'JULIANA', 'BDPS', 'MCA', 22000 Union all
Select 'KAMALA', 'PRAGATHI', 'DCA', 5000 Union all
Select 'MARY', 'SABHARI', 'PGDCA', 4500 Union all
Select 'NELSON', 'PRAGATHI', 'DAP', 6200 Union all
Select 'PATRICK', 'PRAGATHI', 'DCAP', 5200 Union all
Select 'QADIR', 'APPLE', 'HDCA', 14000 Union all
Select 'RAMESH', 'SABHARI', 'PGDCA', 4500 Union all
Select 'REBECCA', 'BRILLIANT', 'DCAP', 11000 Union all
Select 'REMITHA', 'BDPS', 'DCS', 6000 Union all
Select 'REVATHI', 'SABHARI', 'DAP', 5000 Union all
Select 'VIJAYA', 'BDPS', 'DCA', 48000

Create Table Software

( PNAME varchar(20),
  TITLE varchar(60),
  DEVELOPIN varchar(10),
  SCOST	int,
  DCOST int,
  SOLD int
)

Insert into Software (PNAME,TITLE,DEVELOPIN,SCOST,DCOST,SOLD)
Select 'MARY', 'README', 'CPP', 300, 1200, 84 Union all
Select 'ANAND', 'PARACHUTES', 'BASIC', 399.95, 6000, 43 Union all
Select 'ANAND', 'VIDEO TITLING', 'PASCAL', 7500, 16000, 9 Union all
Select 'JULIANA', 'INVENTORY', 'COBOL', 3000, 3500, 0 Union all
Select 'KAMALA', 'PAYROLL PKG.', 'DBASE', 9000, 20000, 7 Union all
Select 'MARY', 'FINANCIAL ACCT.', 'ORACLE', 18000, 85000, 4 Union all
Select 'MARY', 'CODE GENERATOR', 'C', 4500, 20000, 23 Union all
Select 'PATTRICK', 'README', 'CPP', 300, 1200, 84 Union all
Select 'QADIR', 'BOMBS AWAY' ,'ASSEMBLY', 750, 3000, 11 Union all
Select 'QADIR', 'VACCINES', 'C', 1900, 3100, 21 Union all
Select 'RAMESH', 'HOTEL MGMT.', 'DBASE', 13000, 35000, 4 Union all
Select 'RAMESH', 'DEAD LEE', 'PASCAL', 599.95, 4500, 73 Union all
Select 'REMITHA', 'PC UTILITIES', 'C', 725, 5000, 51 Union all
Select 'REMITHA', 'TSRHELP PKG.', 'ASSEMBLY', 2500, 6000, 7 Union all
Select 'REVATHI', 'HOSPITAL MGMT.', 'PASCAL', 1100, 75000, 2 Union all
Select 'VIJAYA', 'TSR EDITOR', 'C', 900, 700, 6

Create Table PROGRAMMER

( PNAME varchar(100),
  DOB datetime,
  DOJ datetime,
  GENDER varchar(10),
  PROF1 varchar(50),
  PROF2 varchar(50),
  SALARY int
)

insert into PROGRAMMER(PNAME,DOB,DOJ,GENDER,PROF1,PROF2,SALARY)

Select 'ANAND', '12-Apr-66', '21-Apr-92', 'M', 'PASCAL', 'BASIC', 3200 union all
Select 'ALTAF', '02-Jul-64', '13-Nov-90', 'M', 'CLIPPER', 'COBOL', 2800 union all
Select 'JULIANA', '31-Jan-60', '21-Apr-90', 'F', 'COBOL', 'DBASE', 3000 union all
Select 'KAMALA', '30-Oct-68', '02-Jan-92', 'F', 'C', 'DBASE', 2900 union all
Select 'MARY', '24-Jun-70', '01-Feb-91', 'F', 'CPP', 'ORACLE', 4500 union all
Select 'NELSON', '11-Sep-85', '11-Oct-89', 'M', 'COBOL', 'DBASE', 2500 union all
Select 'PATTRICK', '10-Nov-65', '21-Apr-90', 'M', 'PASCAL', 'CLIPPER', 2800 union all
Select 'QADIR', '31-Aug-65', '21-Apr-91', 'M', 'ASSEMBLY', 'C', 3000 union all
Select 'RAMESH', '03-May-67', '28-Feb-91', 'M', 'PASCAL', 'DBASE', 3200 union all
Select 'REBECCA', '01-Jan-67', '01-Dec-90', 'F', 'BASIC', 'COBOL', 2500 union all
Select 'REMITHA', '19-Apr-70', '20-Apr-93', 'F', 'C', 'ASSEMBLY', 3600 union all
Select 'REVATHI', '02-Dec-69', '02-Jan-92', 'F', 'PASCAL', 'BASIC', 3700 union all
Select 'VIJAYA', '14-Dec-65', '02-May-92', 'F', 'FOXPRO', 'C', 3500


Select * from STUDIES
Select * from SOFTWARE
Select * from PROGRAMMER


--1. Find out the selling cost AVG for packages developed in Pascal. 
		
		Select DEVELOPIN,Avg(SCOST) as Avgselling
		From Software
		group by DEVELOPIN
		Having AVG(SCOST) = 3066

--2. Display Names, Ages of all Programmers.

		Select p.Pname, DATEDIFF(year,p.DOB,getdate()) as Age
		From PROGRAMMER as p

--3. Display the Names of those who have done the DAP Course. 

		Select * 
		From STUDIES
		where course = 'DAP'
--4. Display the Names and Date of Births of all Programmers Born in January. 
		
		Select * from
		(
		Select * , DATEPART(month,DOB) as Month
		From PROGRAMMER
		) as x
		where Month = 1 

--5. What is the Highest Number of copies sold by a Package? 
		
		
		Select MAX(Sold) as HighestNosold
		From Software

		
--6. Display lowest course Fee. 

		Select Min(Course_fee) as Lowest
		From Studies

--7. How many programmers done the PGDCA Course? 

		Select *
		From Studies
		Where Course = 'PGDCA'

--8. How much revenue has been earned thru sales of Packages Developed in C.

		Select * From
		(
		Select DEVELOPIN , ((Sum(Scost)*Sum(Sold))-sum(Dcost)) as revenue
		From Software
		group by DEVELOPIN
		) as X
		where DEVELOPIN = 'C'

		
--9. Display the Details of the Software Developed by Ramesh. 

		Select *
		From Software
		where PName = 'Ramesh'

--10. How many Programmers Studied at Sabhari? 

		Select *
		From Studies
		Where INSTITUTE = 'Sabhari'

--11. Display details of Packages whose sales crossed the 2000 Mark.

		Select * 
		From Software
		where Scost > 2000

--12. Display the Details of Packages for which Development Cost have been recovered. 

		Select *
		From Software
		where SCOST*SOLD >= DCOST;

--13. What is the cost of the costliest software development in Basic? 

		Select DEVELOPIN ,MAx(Scost) as MaxScost
		From Software
		group by DEVELOPIN
		having DEVELOPIN = 'Basic'


--14. How many Packages Developed in DBASE? 

		Select * 
		From Software
		where DEVELOPIN = 'DBASE'

--15. How many programmers studied in Pragathi? 

		Select *
		From STUDIES
		where INSTITUTE = 'Pragathi'


--16. How many Programmers Paid 5000 to 10000 for their course? 

		Select *
		From PROGRAMMER
		where SALARY between 5000 and 10000

--17. What is AVG Course Fee 

		Select course, AVG(Course_fee) as AVGCourse
		From STUDIES
		group by COURSE

--18. Display the details of the Programmers Knowing C.

		Select *
		From PROGRAMMER
		where PROF1 = 'C'
		or PROF2 = 'C'

--19. How many Programmers know either COBOL or PASCAL.

		Select *
		From PROGRAMMER
		Where PROF1 = 'COBOL'
		or PROF1 = 'PASCAL'
		or PROF2 = 'COBOL'
		or PROF2 = 'PASCAL'

--20. How many Programmers Don’t know PASCAL and C 
		
		Select *
		From PROGRAMMER
		Where PROF1 <> 'C'
		and PROF1 <> 'PASCAL'
		and PROF2 <> 'C'
		and PROF2 <> 'PASCAL'

--21. How old is the Oldest Male Programmer. 
		
		Select max(age)as oldestage From
		(
		Select pname, GENDER,(datediff(year,DOB,getdate())) as age
		From PROGRAMMER
		where Gender = 'M'
		) as P

--22. What is the AVG age of Female Programmers? 
		
		Select GENDER, Avg(DATEDIFF(year,DOB,getdate())) as Age
		From PROGRAMMER
		group by GENDER
		having GENDER = 'f'

--23. Calculate the Experience in Years for each Programmer and Display with their 
--names in Descending order.

		Select * from 
		(
		Select PNAME, Datediff(year,doj,getdate()) as EXP
		From PROGRAMMER
		) as x
		order by exp desc

--24. Who are the Programmers who celebrate their Birthday’s During the Current
--Month? 
		
		Select * from
		(Select PNAME, datepart(month,dob) as Birthmonth
		From PROGRAMMER) as X
		Where birthmonth = 9

--25. How many Female Programmers are there? 

		Select count(gender) as Totalfemale 
		From PROGRAMMER
		Where gender = 'F'

--26. What are the Languages studied by Male Programmers.

		select Pname, PROF1, PROF2
		from PROGRAMMER
		where gender = 'M'


--27. What is the AVG Salary? 

		Select Avg(Salary) as AVGSAL
		From PROGRAMMER

--28. How many people draw salary 2000 to 4000? 

		Select * --Count(pname) as TotalPeople
		From PROGRAMMER
		Where Salary between 2000 and 4000

--29. Display the details of those who don’t know Clipper, COBOL or PASCAL. 

		Select *
		From PROGRAMMER
		Where PROF1 <> 'clipper'
			And PROF1 <> 'Cobol'
			And PROF1 <> 'Pascal'
			and PROF2 <> 'clipper'
			And PROF2 <> 'Cobol'
			And PROF2 <> 'Pascal'

--30. Display the Cost of Package Developed By each Programmer.

		Select PNAME, Sum(SCOST) as cost_of_package
		From Software
		group by PNAME

--31. Display the sales values of the Packages Developed by the each Programmer.

			Select PNAME, (SCOST*SOLD) as sales
			From Software

--32. Display the Number of Packages sold by Each Programmer. 

		Select pname, SUm(Sold) As Noofpackagessold
		From Software
		Group by PNAME
		having sum(sold) >0

--33. Display the sales cost of the packages Developed by each Programmer Language wise.

		Select DEVELOPIN, SUM(SCOST*SOLD) as SalesCost
		From Software
		Group by DEVELOPIN
		Having SUM(SCOST*SOLD) > 0

--34. Display each language name with AVG Development Cost, AVG Selling Cost and
--AVG Price per Copy. 

		Select DEVELOPIN, Avg(DCOST) as AVGDCOST, AVG(SCOST) as AVGSCOST, AVG(SCOST) as AVGPRICE 
		From Software
		Group by DEVELOPIN
	
--35. Display each programmer’s name, costliest and cheapest Packages Developed by him or 
--her.

		Select PNAME, max(DCOST) as costliest, min(SCOST) as cheapest
		From Software
		Group by Pname

--36. Display each institute name with number of Courses, Average Cost per Course.
		
		Select INSTITUTE, Count(course) as NOofcourses, AVG(COURSE_FEE) as AVGFEE
		From STUDIES
		group by INSTITUTE
		
--37. Display each institute Name with Number of Students. 

		Select INSTITUTE, Count(Pname) as Noofstudent 
		From STUDIES
		Group by INSTITUTE

--38. Display Names of Male and Female Programmers. Gender also. 

		Select PNAME, GENDER
		From PROGRAMMER

--39. Display the Name of Programmers and Their Packages.

		Select PNAME, Salary
		From PROGRAMMER

--40. Display the Number of Packages in Each Language Except C and C++. 
			
			Select DEVELOPIN, Count(Title) as Noofpack
			From Software
			group by DEVELOPIN
			Having DEVELOPIN <>'C' 
			and DEVELOPIN <> 'C++'

--41. Display the Number of Packages in Each Language for which Development Cost is
--less than 1000.

		Select DEVELOPIN,COUNT(Title) as noofpack
		From Software
		where dcost <1000
		Group by DEVELOPIN

--42. Display AVG Difference between SCOST, DCOST for Each Package. 

		Select Title , (Avg(Dcost)-Avg(Scost)) as AVGdiff
		From Software
		group by title

--43. Display the total SCOST, DCOST and amount to Be Recovered for each 
--Programmer for Those Whose Cost has not yet been Recovered. 

		Select * From
		(
		Select PNAME, Scost, Dcost, (Scost*Sold)-Dcost as Cost
		From Software
		) as x
		Where Cost < 0

--44. Display Highest, Lowest and Average Salaries for those earning more than 2000.

		Select max(salary) as Maxsal,min(salary) as Minsal, avg(salary) as AVGsal
		From PROGRAMMER
		where SALARY > 2000

--45. Who is the Highest Paid C Programmers?

		Select *
		from PROGRAMMER
		Where Salary = (Select max(salary)
		       from PROGRAMMER 
			   where PROF1 = 'C'
			      or PROF2 = 'C')

--46. Who is the Highest Paid Female COBOL Programmer? 

		Select * 
		From PROGRAMMER
		where SALARY = (select max(salary)
						from PROGRAMMER
						where (PROF1='COBOL'
						or Prof2='COBOL'))
						And GENDER = 'F'

--47. Display the names of the highest paid programmers for each Language. 

	
;With CTC (Pname, Prof, Salary)
as 
(Select Pname, Prof1 as prof, Salary
from PROGRAMMER
Union
Select Pname, Prof2, salary
from PROGRAMMER)

Select P1.Pname, p1.prof, p1.Salary 
from CTC as P1
left join CTC as p2 on p1.Prof=P2.Prof and p1.Salary < p2.Salary
where P2.pname is null;

--48. Who is the least experienced Programmer. 
		
		Select * From
		(
		Select min(DATEDIFF(year,DOJ,getdate())) as MinYears
		From PROGRAMMER
		) as X

--49. Who is the most experienced male programmer knowing PASCAL. 
		
		Select max(DATEDIFF(year,DOJ,getdate())) as EXPce
		From PROGRAMMER
		where PROF1 = 'Pascal' or PROF2 = 'Pascal'
				And Gender = 'M'

--50. Which Language is known by only one Programmer? 
		
		;With CTE(pname,Prof)
		as
		(Select Pname, Prof1 as prof
		From PROGRAMMER
		union
		Select pname, prof2
		from programmer)

		Select Prof
		from CTE
		group by Prof
		having Count(prof) = 1

		
--51. Who is the Above Programmer Referred in Q.50?
		
			Create Table ASLang
			(Prof varchar(20)
			)

			Select * From ASLang

			Insert into aslang
			Select prof1 from PROGRAMMER
			group by PROF1
			having PROF1 not in(select Prof2 from PROGRAMMER)
			and count(prof1) = 1
			union 
			Select PROF2 from PROGRAMMER
			group by PROF2
			having PROF2 not in(select PROF1 from PROGRAMMER)
			and count(PROF2) = 1
	
			Select Pname, prof from PROGRAMMER
			Inner join ASLang on prof=prof1 or prof=prof2
			
--52. Who is the Youngest Programmer knowing DBASE?
		
		SELECT pname, prof1, prof2, datediff(YEAR, dob, getdate()) as age
		from programmer 
		where dob = (SELECT max(dob) from programmer where prof1='dbase' or prof2='dbase');

--53. Which Female Programmer earning more than 3000 does not know C, C++, 
--ORACLE or DBASE? 

		Select * from PROGRAMMER
		where gender = 'F'
			and Salary >3000
			and PROF1 <> 'c' 
			and PROF1 <>'c++'
			and PROF1 <>'oracle'
			And PROF1<>'dbase'
			and PROF2 <> 'c' 
			and PROF2 <>'c++'
			and PROF2 <>'oracle'
			And PROF2<>'dbase'

--54. Which Institute has most number of Students? 


		Select top 1 INSTITUTE, count(pname) as countno
		From STUDIES
		group by INSTITUTE
		order by Count(pname) desc
		
--55. What is the Costliest course? 
		
		Select * From STUDIES
		where COURSE_FEE=
		(Select max(Course_fee) as costiest
		From STUDIES)

--56. Which course has been done by the most of the Students? 
		
		Select Top 2 COURSE , Count(COURSE) as Courseno
		From STUDIES
		group by COURSE
		order by Courseno desc
		
--57. Which Institute conducts costliest course. 

		Select Top 1 INSTITUTE, Max(course_fee) as Co
		From STUDIES
		Group by INSTITUTE
		order by CO desc;

--58. Display the name of the Institute and Course, which has below AVG course fee. 
		
		Select institute, Course
		from STUDIES
		where COURSE_FEE < (select avg(course_fee) from STUDIES);


--59. Display the names of the courses whose fees are within 1000 (+ or -) of the 
--Average Fee, 

		Select COURSE
		From Studies
		where COURSE_FEE < (Select AVG(course_fee)+1000 from STUDIES)
						AND Course_fee > (Select AVG(Course_fee)-1000 from STUDIES)


--60. Which package has the Highest Development cost? 
		
		Select Title, DCOST from Software
		where DCOST = (Select Max(DCOST)
				From Software)

--61. Which course has below AVG number of Students? 
		
		Create table AVGcount (CRS varchar(20), Cnt INT)

		INSERT INTO AVGcount(CRS,CNT)
		Select COURSE, count(PNAME) as Coursecount From STUDIES group by COURSE
		Select CRS, CNT from AVGcount where Cnt <= (select avg(cnt) from AVGcount)
		
		Select * from AVGcount
		--Drop table AVGcount


--62. Which Package has the lowest selling cost? 

		Select TITLE, Scost
		From Software
		where scost = (select min(scost) from Software)


--63. Who Developed the Package that has sold the least number of copies? 

		Select pname, TITLE, SOLD
		from Software
		where SOLD = (select min(sold) from Software)

--64. Which language has used to develop the package, which has the highest 
--sales amount?

		Select * From 
		( Select *, Scost as Sell
			from Software) as x
		where Sell = (select max(scost) from Software)

--65. How many copies of package that has the least difference between 
--development and selling cost where sold. 

		Select Title,SOLD as cost
		from Software
		where title = (select title from Software
		Where (DCOST-SCOST) = (Select min(DCOST-SCOST) from Software))

--66. Which is the costliest package developed in PASCAL.

		Select TITLE, DEVELOPIN
		From Software
		Where DCOST = (select max(DCOST) from software
		            where DEVELOPIN = 'Pascal')

--67. Which language was used to develop the most number of Packages. 
		
		Select top 1 DEVELOPIN, Count(TITLE) as countT
		From Software
		group by DEVELOPIN
		order by CountT desc

--68. Which programmer has developed the highest number of Packages? 

		Select Pname
		From Software
        group by Pname
		having Pname = (Select Max(Pname) from Software)

--69. Who is the Author of the Costliest Package? 

		Select pname, DCOST
		From Software
		where DCOST = (Select max(DCOST) from Software)

--70. Display the names of the packages, which have sold less than the AVG 
--number of copies. 

		Select TITLE
		From Software
		where sold < (select avg(sold) from Software)
			   
--71. Who are the authors of the Packages, which have recovered more than double the 
--Development cost? 

		Select distinct PNAME
		From Software
		where 2*DCOST>=Scost*Sold

--72. Display the programmer Name and the cheapest packages developed by them in
--each language. 
		
		Select Pname, TITLE	
		from Software
		where dcost in (select min(dcost) from Software
						group by DEVELOPIN)

--73. Display the language used by each programmer to develop the Highest 
--Selling and Lowest-selling package. 

		Select DEVELOPIN, PNAME
		From Software
		where SOLD in (Select max(SOLD) from Software group by pname)
		union
		Select DEVELOPIN, PNAME
		From Software
		where SOLD in (Select min(SOLD) from Software group by pname)

--74. Who is the youngest male Programmer born in 1965? 

		Select Pname, datepart(year,DOB) as Yearofbirth, GENDER, DATEDIFF(year,dob,getdate()) as age
		from PROGRAMMER
		where datepart(year,DOB) = '1965' and GENDER = 'M'

--75. Who is the oldest Female Programmer who joined in 1965?

		Select Pname, datepart(year,DOB) as Yearofbirth, GENDER, DATEDIFF(year,dob,getdate()) as age
		from PROGRAMMER
		where datepart(year,DOB) = '1965' and GENDER = 'F'

--76. In which year was the most number of Programmers born.

		Create Table temp(YOB int, CNT int)
		Insert into temp
		select year(DOB), count(pname) from PROGRAMMER
		group by year(dob)

		Select * from Temp

		Select YOB,CNT from temp 
		where cnt = (select max(cnt) from temp)

--77. In which month did most number of programmers join? 

		create table temp_month(monthP int,cnt int)
		insert into temp_month
		select month(DOJ), count(pname) from PROGRAMMER
		group by Month(DOJ)
		
		Select * from temp_month
		Select Monthp,CNT from temp_month
		where CNT in (select max(cnt) from temp_month)


--78. In which language are most of the programmer’s proficient. 
		
		create table Proff(prof varchar(20),cnt int)
		insert into Proff(prof,cnt)
		select Prof1,count(pname) from PROGRAMMER group by PROF1
		union all
		select Prof2,count(pname) from PROGRAMMER group by PROF2
		--Drop table proff2
		--Select * from Proff

		Create table proff2(pro varchar(20),cn int)
		Insert into proff2 (pro,cn)
		Select prof,sum(cnt) from Proff
		group by prof

		--Select * from Proff
		Select * from Proff2
		Where CN = (select max(CN) from Proff2)

--79. Who are the male programmers earning below the AVG salary of
--Female Programmers?

		Select PNAME, GENDER
		From PROGRAMMER
		where SALARY < (select avg(salary) from PROGRAMMER
						where gender='F')
						And Gender='m'

--80. Who are the Female Programmers earning more than the Highest Paid? 

		Select Pname, Salary
		From PROGRAMMER
		where SALARY >= (select max(salary) from PROGRAMMER
						where gender ='m')
						And Gender = 'F'
		
--81. Which language has been stated as the proficiency by most of the Programmers?

		Select prof1
		From PROGRAMMER
		group by prof1
		having prof1 = (select max(prof1) from PROGRAMMER)
		union
		Select Prof2
		From PROGRAMMER
		group by PROF2
		having PROF2 = (select max(PROF2) from PROGRAMMER)

--82. Display the details of those who are drawing the same salary. 

		
		Select *
		From PROGRAMMER
		where SALARY in (Select SALARY from PROGRAMMER
						group by SALARY
						having count(SALARY)>1);

--83. Display the details of the Software Developed by the Male Programmers Earning 
--More than 3000/-. 

		Select *
		from PROGRAMMER p, Software s
		where p.pname = s.pname and salary > 3000 and gender = 'M'

--84. Display the details of the packages developed in Pascal by the Female 
--Programmers.

			Select s.*
			From Software s, PROGRAMMER p
			where s.pname = p.pname and DEVELOPIN = 'PAscal' and gender = 'F'

--85. Display the details of the Programmers who joined before 1990. 

		Select *
		From PROGRAMMER
		where year(DOJ)<1990

--86. Display the details of the Software Developed in C By female programmers of
--Pragathi.

		Select s.*
		From Software s,STUDIES st,PROGRAMMER p
		where S.pname = st.pname and p.pname = s.pname and Gender = 'F' and INSTITUTE ='pragathi' 

--87. Display the number of packages, No. of Copies Sold and sales value of
--each programmer institute wise.

		Select p.INSTITUTE, count(s.DEVELOPIN) as Developin,count(s.sold) as Sold, Sum(s.sold*s.scost) as Sales
		From STUDIES p, Software s
		where p.pname = s.PNAME
		group by p.INSTITUTE
		
--88. Display the details of the software developed in DBASE by Male Programmers, who 
--belong to the institute in which most number of Programmers studied.
		
		create Table INST(ins varchar(20), CNT int)
		Insert into INST
		Select institute, count(pname) from STUDIES
		Group by Institute
		
		Select * from INST

		Select distinct sw.*
		From PROGRAMMER p, STUDIES s, Software sw, INST
		Where DEVELOPIN = 'DBASE' and gender = 'M' and SW.pname = P.pname
			and INSTITUTE = INS and CNT = (Select max(CNT) from INST)

--89. Display the details of the software Developed by the male programmers Born 
--before 1965 and female programmers born after 1975. 

		Select s.*,Year(p.DOB), GENDER
		From Software s, PROGRAMMER p
		where s.pname=p.pname and ((GENDER='M' AND YEAR(DOB)<1965) OR (GENDER='F' AND YEAR(DOB)>1975))

--90. Display the details of the software that has developed in the language which is
--neither the first nor the second proficiency of the programmers.
		
		Select s.*
		From PROGRAMMER p, Software s
		where p.pname=s.pname and p.PROF1<>s.DEVELOPIN and p.prof2<>s.DEVELOPIN

--91. Display the details of the software developed by the male students of Sabhari. 

		Select s.*
		From Software s, STUDIES ST, PROGRAMMER P
		where s.PNAME = ST.PNAME and p.pname = s.pname and gender = 'M' and st.INSTITUTE ='Sabhari' 


--92. Display the names of the programmers who have not developed any packages.

		Select PNAME
		From PROGRAMMER
		where pname not in (Select Pname from Software)

--93. What is the total cost of the Software developed by the programmers of Apple?

		Select Sum(Scost) as Totalcost
		from Software s, STUDIES st
		where s.PNAME = st.PNAME and st.INSTITUTE = 'APPLE'

--94. Who are the programmers who joined on the same day? 


		Select A.Pname,A.DOJ
		From PROGRAMMER A, PROGRAMMER B
		where a.doj = b.doj and A.pname<>b.pname

--95. Who are the programmers who have the same Prof2? 

		Select Distinct(a.Pname), a. PROF2
		From PROGRAMMER a, PROGRAMMER b
		where a.PROF1 = b.PROF2 and a.pname <> b.pname

--96. Display the total sales value of the software, institute wise. 

		Select St.institute, Sum(s.sold*s.SCOST) as Total_Sales_Value
		from STUDIES st, Software s
		Where st.pname = S.PNAME
		group by st.INSTITUTE

--97. In which institute does the person who developed the costliest package studied. 

		Select INSTITUTE
		From STUDIES st, Software s
		where st.pname = s.pname and DCOST = (Select Max(DCOST) from Software)
		group by INSTITUTE
		
--98. Which language listed in prof1, prof2 has not been used to develop any package. 

			Select Prof1 from PROGRAMMER where PROF1 not in (select developin from Software)
			Union
			Select Prof2 from PROGRAMMER where PROF2 not in (select developin from Software)
			
--99. How much does the person who developed the highest selling package earn and
--what course did HE/SHE undergo.

			Select p.Pname, p.Salary,st.COURSE
			From PROGRAMMER p, STUDIES St
			Where p.pname =st.pname and p.Salary = (Select max(Salary) from PROGRAMMER)

--100. What is the AVG salary for those whose software sales is more than 50,000/-. 

		Select AVG(Salary) as AVGSAL
		from Software s, PROGRAMMER p
		where s.pname = P.pname and SCOST*SOLD>50000;

--101. How many packages were developed by students, who studied in institute that 
--charge the lowest course fee?

		Select s.pname, Count(title) as Packages
		From STUDIES st, Software s
		Where st.pname = s.pname and COURSE_FEE = (select min(course_fee) from STUDIES)
		Group by S.pname, Course_fee


--102. How many packages were developed by the person who developed the 
--cheapest package, where did HE/SHE study?

			Select Count(DEVELOPIN) as package
			From PROGRAMMER s, Software P
			where S.pname = p.pname --and DCOST = (select min(DCOST) From Software)
			Group by DEVELOPIN
			having min(dcost)=(select min(dcost) from software)

--103. How many packages were developed by the female programmers earning more 
--than the highest paid male programmer? 

		Select Count(DEVELOPIN)
		From Software s, PROGRAMMER p
		where s.pname = p.pname and  gender = 'F' and Salary>(select max(salary) from PROGRAMMER where gender = 'M')

--104. How many packages are developed by the most experienced programmer form 
--BDPS.

		select count(*) as Countp
		from software s,programmer p
		where p.pname=s.pname 
		group by doj 
		having min(doj)=(select min(doj)
		from studies st,programmer p, software s
        where p.pname=s.pname and st.pname=p.pname and (institute='bdps'));

--105. List the programmers (form the software table) and the institutes they studied. 
--including those WHO DIDN'T develop any package.

		
		Select PNAME, institute
		from STUDIES 
		where pname not in (Select pname from Software)

		
--106. List each PROF with the number of Programmers having that PROF and the 
--number of the packages in that PROF.

		
		Select count(*),sum(scost*sold-dcost) "PROFIT" 
		from software
		where developin in (select distinct(prof1) from programmer
							union
							select distinct(PROF2) from programmer)
		group by developin;



--107. List the programmer names (from the programmer table) and No. Of Packages 
--each has developed.
					Select P.pname, count(developin) as Developin
					From PROGRAMMER p, Software s
					where S.pname = P.pname
					group by p.pname