CREATE DEFINER=`Admin1`@`%` PROCEDURE `CancelOrder`(Orderid int)
BEGIN
delete from Orders where OrderID=Orderid;
select concat("Order ", OrderID, " is cancelled") as Confirmation;
END