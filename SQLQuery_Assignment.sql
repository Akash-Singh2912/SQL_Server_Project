--Assignment (Module 2)

-- 1.	Create a customer table which comprises of these columns – 
     --‘customer_id’, ‘first_name’, ‘last_name’, ‘email’, ‘address’, ‘city’,’state’,’zip’
	 
		--Use SQLserver_21_08_2022

	 Create table Customer
	 (
		Customer_ID int
		,first_name varchar(30)
		,last_name varchar(30)
		,email varchar(100)
		,Address varchar(100)
		,City varchar(50)
		,ZIP int
	 )

--2.	Insert 5 new records into the table

	  Insert Into Customer(Customer_ID,first_name,last_name,email,Address,City,ZIP)
	  Select 1,'Akash','Singh','abc@gmail.com','India','Delhi',110045 union all
	  Select 2,'Parul','Aggarwal','bac@gmail.com','US','New york',110046 union all
	  Select 3,'Ashish','Kumar','bbc@gmail.com','China','Shanghai',110047 union all
	  Select 4,'Simranjeet','kaur','ccc@gmail.com','England','oxford',110048 union all
	  Select 5,'Alka','vaid','aac@gmail.com','UAE','Dubai',110049 

	  Select * From Customer

-- 3.	Select only the ‘first_name’ & ‘last_name’ columns from the customer table

	Select cus.first_name,cus.last_name
	from Customer as cus

--4.	Select those records where ‘first_name’ starts with “P” and city is ‘New york’
		
		Select cus.first_name,cus.city
		from Customer as cus
		where first_name like ('P%') and City = 'new york'

--Assignment (Module 3)

-- 1.	Create an ‘Orders’ table which comprises of these columns – ‘order_id’, ‘order_date’, ‘amount’, ‘customer_id’


		Create table Orders
		(
		Order_ID int
		,Order_date datetime
		,Amount int
		,Customer_ID int
		)

		Insert into Orders(Order_ID,Order_date,Amount,Customer_ID)
		Select 10,getdate()-5,1000,1 union all
		Select 11,getdate()-6,2000,2 union all
		Select 12,getdate()-7,3000,3 union all
		Select 13,getdate()-8,4000,4 

--2.	Make an inner join on ‘Customer’ & ‘Order’ tables on the ‘customer_id’ column

		Select cus.Customer_id,cus.first_name,cus.last_name,cus.email,ord.order_date,ord.Amount
		From Customer as cus
		inner join Orders as ord on cus.Customer_ID = ord.Customer_ID

--3.	Make left and right joins on ‘Customer’ & ‘Order’ tables on the ‘customer_id’ column

		Select cus.Customer_id,cus.first_name,cus.last_name,cus.email,ord.order_date,ord.Amount
		From Customer as cus
		Left join Orders as ord on cus.Customer_ID = ord.Customer_ID
		

		Select cus.Customer_id,cus.first_name,cus.last_name,cus.email,ord.order_date,ord.Amount
		From Customer as cus
		Right join Orders as ord on cus.Customer_ID = ord.Customer_ID

--4.	Update the ‘Orders’ table, set the amount to be 100 where ‘customer_id’ is 3

		Update Orders
		Set Amount = 100
		where customer_id =3

		Select * From orders
		

-- Assignment (Module 4)

--1.	Use the inbuilt functions and find the minimum, maximum and average amount from the orders table


		Select * 
		From Orders


		Select Max(Amount) as MaxAmount
		From Orders
		
		Select Min(Amount) as MinAmount
		From Orders
		
		Select Avg(Amount) as Avgamount
		From Orders


-- 2.	Create a user-defined function, which will multiply the given number with 10

		Create or alter function fn_Multiply
		(@Number int)
		Returns int
		as 
		begin
			return(@Number*10)
		End

		Select dbo.fn_Multiply(10) as Result

--3.	Use the case statement to check if 100 is less than 200, greater than 200 or equal to 2oo 
      --and print the corresponding value

	  Select *, case when Amount < 200 then 'Amount is less than 200' 
	  When Amount > 200 then 'Amount is greater than 200' 
	  when Amount <= 200 then 'Amount is equal to 200' Else 'NA'
	  end as CheckAmount
	  From Orders


-- Assignment (Module 5)

--1.	Arrange the ‘Orders’ dataset in decreasing order of amount

		Select *
		From Orders
		Order by Order_ID desc

--2.	Create a table with name ‘Employee_details1’ and comprising of these columns – ‘Emp_id’, ‘Emp_name’, ‘Emp_salary’. 
      --Create another table with name ‘Employee_details2’, which comprises of same columns as first table.

	  Create Table Employee_details1
	  (
	  Emp_id int
	  ,Emp_name Varchar(50)
	  ,Emp_salary varchar(50)
	  )

	  Insert into Employee_details1(Emp_id,Emp_name,Emp_salary)
	  Select 1,'Akash',5000 Union all
	  Select 2,'Parul',10000 Union all
	  Select 3,'Rajiv',15000 Union All
	  Select 4,'Ravi', 10280 Union all
	  Select 5,'Sandeep',11250 

	  GO

	  Create table Employee_details2
	  (
	  Emp_id int
	  ,Emp_name Varchar(50)
	  ,Emp_salary varchar(50)
	  )
	  Insert into Employee_details2(Emp_id,Emp_name,Emp_salary)
	  Select 1,'Paro',5000 Union all
	  Select 2,'Sonia',10000 Union all
	  Select 3,'Babli',15000 Union All
	  Select 4,'Monika', 10280 Union all
	  Select 5,'Raj',11250 

	  Select * From Employee_details1
	  Select * From Employee_details2

--3.	Apply the union operator on these two tables

		Select Emp_id, Emp_salary From Employee_details1
		Union
   	    Select Emp_id, Emp_salary From Employee_details2


--4.	Apply the intersect operator on these two tables

		Select Emp_id, Emp_salary 
		From Employee_details1
		Intersect
   	    Select Emp_id, Emp_salary 
		From Employee_details2

--5.	Apply the except operator on these two tables

-- Except operator
	-- Return the records which are present in first SELECT but missing in second 

		Select Emp_id, Emp_salary 
		From Employee_details1
		Except
   	    Select Emp_id, Emp_salary 
		From Employee_details2
		where Emp_salary < 15000

-- Assignment (Module 6)

--1.	Create a view named ‘customer_san_jose’ which comprises of only those customers who are from san jose
			
			
			Create or alter view Customer_san_jose
			as
				Select * from Customer
				where Address = 'India'

			

			Select * from Customer_san_jose

--2.	Inside a transaction, update the first name of the customer to Francis, where the last name is Jordan
      --a.Rollback the transaction
      --b.Set the first name of customer to Alex, where the last name is Jordan

		Begin try
			Begin Transaction

			--Select * from Customer

			Update Customer
			Set first_name = 'Francis',
			last_name = 'Jordan'
			From Customer
			where Customer_ID = 2

			--Update Customer
			--Set Customer_ID = 1/0
			--where Customer_ID = 1

			Commit transaction
			
			Print 'Updated successfully'
			
		End try

		Begin Catch
			
			Rollback transaction
				Print 'error found'

				Update Customer
				Set first_name = 'Alex',
			    last_name = 'Jordan'
				From Customer
				Where Customer_ID = 2
			
		 End Catch

	SELECT * FROM Customer  

--3.	Inside a try catch block, divide 100 with 0, print the default error message

		Begin Try
			Begin Transaction
				Update Customer
				Set Customer_ID = 100/0
				from Customer 
				Where Customer_ID = 2
			Commit Transaction
		End Try
		Begin Catch
			Rollback Transaction
				Print 'Error found'
		End Catch



