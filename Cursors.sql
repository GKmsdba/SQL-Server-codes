
-- Demonstrate the use of cursor on Production.Product table.
-- Step 1 - Declare the cursor
declare crProduct cursor
for
	select ProductID, [Name], ListPrice
	from Production.Product

	--declare variable containers for retrieving the cursor result
	declare @r_ProductID int = 0
	declare @r_ProductName varchar(100) = ''
	declare @r_ListPrice money = 0.0

-- Step 2 - Open the cursor
	open crProduct

-- Step 3 - Fetch one record using the cursor. This wouldn't be used again as this is not 
--		    inside the loop
	fetch next from crProduct into @r_ProductID, @r_ProductName, @r_ListPrice --Make sure the number and type
																			  --of variables in 'select' query
																			  --and 'fetch into' match

-- Step 4 - Start the loop and check if a record was fetched correctly
	while @@FETCH_STATUS = 0
	begin
		print '--------------'
		print 'Product ID = '+ cast(@r_ProductID as varchar(100))
		print 'Product Name = '+ cast( @r_ProductName as varchar(100))
		print 'Product List Price = '+ cast(@r_ListPrice as varchar(100))

		fetch next from crProduct into @r_ProductID, @r_ProductName, @r_ListPrice
	end
	
--Step 5 - Close cursor
close crProduct
--Step 6 - Deallocate the cursor		
deallocate crProduct		