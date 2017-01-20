-- Cursors + Stored Procedure

-- Find out all the products that haven't been sold even once, give a discount of one dollar on each of them if the 
-- price is greater than one.

create procedure givingDiscount
as
	declare crProducts cursor
	for
		select ProductId,[Name] from [Production].Product 
		
		declare @prodID int
		declare @prodName varchar(100)
		declare @prodPrice int

		open crProducts

		fetch next from crProducts into @prodID, @prodName
		--if((select productID from Sales.SalesOrderDetail where productId = @prodID) > 0) 
		--begin
		--	continue
		--end
		while @@FETCH_STATUS = 0
		begin
			set @prodPrice = (select ListPrice from Production.ProductListPriceHistory where ProductID = @prodID and EndDate is null)

			if @prodPrice >= 1
			begin
				update Production.ProductListPriceHistory
				set EndDate = GETDATE()

				insert into Production.ProductListPriceHistory
				values(@prodID, getdate(), null, @prodPrice -1, getdate())

				print 'Product Id = '+cast(@prodID as varchar(20))
				print 'Product Name = '+@prodName
				print 'Old Price = '+cast(@prodPrice as varchar(20))
				print 'New Price = '+cast((@prodPrice-1) as varchar(20))
				print '---------------------------------'
			end
			fetch next from crProducts into @prodID, @prodName
		end
	close crProducts
	deallocate crProducts
	return 1
		
EXEC givingDiscount





select * from Production.ProductListPriceHistory


select * from Production.ProductListPriceHistory where  EndDate is NULL
select * from sales.Customer -- 19185

select * from Sales.SalesOrderHeader -- 31465

select * from Sales.Customer c
left outer join Sales.SalesOrderHeader soh on c.CustomerID = soh.CustomerID
where soh.CustomerID 


select ProductID, UnitPrice from Sales.SalesOrderDetail
group by ProductID, UnitPrice 
order by ProductID

select * from

select * from production.product

select * from Production.ProductListPriceHistory

select * from Production.ProductListPriceHistory 
where ProductId = 707