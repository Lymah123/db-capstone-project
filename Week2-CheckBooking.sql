CREATE DEFINER=`Admin1`@`%` PROCEDURE `CheckBooking`(BookingDate DATE,Table_Number INT)
BEGIN
SELECT CONCAT("Table ", TableNumber, " is already booked")
    WHERE exists (select * from Bookings where Date = BookingDate and TableNumber = Table_Number);
END