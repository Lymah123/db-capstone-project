CREATE DEFINER=`Admin1`@`%` PROCEDURE `GetMaxQuantity`()
BEGIN
select max(Quantity) as GetMaxQuantity from Orders;
END