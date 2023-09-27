use littlelemon;
select Name from Menus where MenusID=any (select MenusID from Orders where Quantity>2) 