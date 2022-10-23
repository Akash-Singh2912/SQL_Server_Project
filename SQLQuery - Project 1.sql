Use AdventureWorks2012

--Project - 1

--Perform the following with help of the above database 
--1. Get all the details from the person table including email ID, phone number, and phone 
   --number type
   
   --Sp_Tables
   --Select * From [Person].[Address]
   --Select * From [Person].[Person]
   --Select * From [Person].[EmailAddress]
   --Select * From [Person].[PersonPhone]
   --Select * From [Person].[PhoneNumberType]

CREATE TABLE #temp_customers (
BusinessEntityID INT,
FullName VARCHAR(100),
EmailAddress Varchar(100),
PhoneNumber nvarchar(100),
PhoneNumbertype varchar(100)
)

--Drop table #temp_customers

Insert into #temp_customers
Select *
From (
Select p.BusinessEntityID,Trim(concat(p.FirstName,' ',p.MiddleName,' ',p.LastName)) as FullName,
EmailAddress, trim(replace(ph.PhoneNumber,'1 (11)',' ')) as PhoneNumber, pn.Name
From [Person].[Person] as p
inner join [Person].[EmailAddress] as Em on em.BusinessEntityID = p.BusinessEntityID
inner join [Person].[PersonPhone] as ph on em.BusinessEntityID=ph.BusinessEntityID
inner join [Person].[PhoneNumberType] as pn on ph.PhoneNumberTypeID = pn.PhoneNumberTypeID
) as x

Select * From #temp_customers

--2. Get the details of the sales header order made in May 2011 
		
		Select * From [Sales].[SalesOrderDetail]
		
		Select *,Format(OrderDate,'Y') as Orderdate 
		From [Sales].[SalesOrderHeader]
		where Format(OrderDate,'Y') = 'May 2011'
							
		
--3. Get the details of the sales details order made in the month of May 2011 

		Select SO.SalesOrderID, So.OrderQTy, SO.UnitPrice, 
		SO.UnitPriceDiscount, SO.LineTotal, 
		Format(SH.OrderDate,'Y') as Orderdate
		From [Sales].[SalesOrderDetail] as SO
		Inner Join [Sales].[SalesOrderHeader] as SH on So.SalesOrderID = SH.SalesOrderID
		Where Format(SH.OrderDate,'Y') = 'May 2011'

--4.Get the total sales made in May 2011.


		Select SO.SalesOrderID, So.OrderQTy, SO.UnitPrice, 
		SO.UnitPriceDiscount, SO.LineTotal as TotalSales, 
		Format(SH.OrderDate,'Y') as Orderdate
		From [Sales].[SalesOrderDetail] as SO
		Inner Join [Sales].[SalesOrderHeader] as SH on So.SalesOrderID = SH.SalesOrderID
		Where Format(SH.OrderDate,'Y') = 'May 2011'

--5. Get the total sales made in the year 2011 by month order by increasing sales.
		
		Select SO.SalesOrderID, So.OrderQTy, SO.UnitPrice, 
		SO.UnitPriceDiscount, SO.LineTotal as TotalSales, 
		Format(SH.OrderDate,'Y') as Orderdate
		From [Sales].[SalesOrderDetail] as SO
		Inner Join [Sales].[SalesOrderHeader] as SH on So.SalesOrderID = SH.SalesOrderID
		Where Format(SH.OrderDate,'Y') = 'May 2011'
		Order by TotalSales


--6. Get the total sales made to the customer with FirstName='Jae' and LastName 
    --'Pak'
		
		Select P.BusinessEntityID, Trim(concat(p.FirstName,' ',p.MiddleName,' ',p.LastName)) as FullName, S.SalesYTD,S.SalesLastYear
		From [Person].[Person] as P
		Inner join [Sales].[SalesPerson] as S on P.BusinessEntityID = S.BusinessEntityID
		Where P.FirstName ='jae' and P.LastName = 'pak'
