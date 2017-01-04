-- Find out all those products which are not there in Product Inventory table

select * from production.Product

select * from production.ProductDescription

select ProductID from production.ProductInventory
group by ProductID

select * from Production.Product prod  --72
left outer join Production.ProductInventory prodInv
on prod.ProductID = prodInv.ProductID
where prodInv.ProductID is null

select prod.ProductID from Production.Product prod 
left outer join Production.ProductInventory prodInv
on prod.ProductID = prodInv.ProductID
where prodInv.ProductID is not null
group by prod.ProductID             --432

select prod.ProductID from Production.Product prod 
left outer join Production.ProductInventory prodInv
on prod.ProductID = prodInv.ProductID
group by prod.ProductID               --504



