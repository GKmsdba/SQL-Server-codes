
	-- This Stored Procedure works on AdventureWorks Database
	-- Find all the records with the given Department Name and Department ID
	-- Give Department Name and ID as the parameter of the Stored Procedure
	create procedure [HumanResources].uspGetAllEmployeesPuneet
								(@DeptName varchar(100),
								 @DeptID varchar(50))
	as 
	select * from 
	HumanResources.Department
	where Name = @DeptName and DepartmentID = @DeptID
	return

	--Calling a stored procedure
	exec [HumanResources].uspGetAllEmployeesPuneet 'Engineering', 1

	--Calling a stored procedure -- Explicit listing of Parameters

	exec [HumanResources].uspGetAllEmployeesPuneet @DeptName = 'Engineering', @DeptID = 1

	
	-- Create a Stored Procedure that takes ProductID as input parameter, calculates the total revenue generated 
	-- by the product and return total units sold, min value and max value

	create procedure Product_Sales_Agg(
		@productID int,
		@totalRev money output,
		@totalunitsold int output,
		@minValue int output,
		@maxValue int output
	)
	as 
	begin
		if exists (select * from Sales.SalesOrderDetail 
					where ProductID = @productID)

		begin
			select @productID = p.ProductID, @totalRev = sum(so.LineTotal), @minValue = min(so.UnitPrice), @maxValue =  max(so.UnitPrice), @totalunitsold = sum(so.OrderQty)
			from Production.Product p
			join Sales.SalesOrderDetail so on p.ProductID = so.ProductID
			where p.ProductID = @productID
			group by p.ProductID

			return

		end
	end
Go

-- Calling a Stored Procedure

declare @ProdId int = 777
declare @SumLineTotal int = 0
declare @MinUnitPrice int = 0
declare @MaxUnitPrice int = 0
declare @OrderQty int  = 0
--print 'ProductId = '+@ProdId
exec Product_Sales_Agg @productID = @ProdId, @totalRev = @SumLineTotal output, @totalunitsold = @OrderQty output, @minValue = @MinUnitPrice output, @maxValue = @MaxUnitPrice output

print 'Product Id = '+ convert( varchar(100), @ProdId)
print 'Line Total = '+ convert(varchar(100), @SumLineTotal)
print 'Min Unit Price = '+ convert(varchar(100), @MinUnitPrice)
print 'Max Unit Price = '+ convert(varchar(100), @MaxUnitPrice)
print 'Order Quantity = '+ convert(varchar(100), @OrderQty)

declare @ProdId1 int = 1

exec Product_Sales_Agg @productID = @ProdId1, @totalRev = @SumLineTotal output, @totalunitsold = @OrderQty output, @minValue = @MinUnitPrice output, @maxValue = @MaxUnitPrice output

print 'Product Id = '+ convert( varchar(100), @ProdId1)
print 'Line Total = '+ convert(varchar(100), @SumLineTotal)
print 'Min Unit Price = '+ convert(varchar(100), @MinUnitPrice)
print 'Max Unit Price = '+ convert(varchar(100), @MaxUnitPrice)
print 'Order Quantity = '+ convert(varchar(100), @OrderQty)


select * from Sales.SalesOrderDetail
select * from Production.Product

select p.ProductID, sum(so.LineTotal) as 'Total Revenue', min(UnitPrice) as 'Minimum Unit Price', max(UnitPrice) as 'Maximum Unit Price', sum(OrderQty) as 'Total Units' 
from Production.Product p
join Sales.SalesOrderDetail so on p.ProductID = so.ProductID
group by p.ProductID


select p.ProductID, sum(so.LineTotal),min(so.UnitPrice), max(so.UnitPrice), sum(so.OrderQty)
			from Production.Product p
			join Sales.SalesOrderDetail so on p.ProductID = so.ProductID
			--where p.ProductID = 1
			group by p.ProductID 