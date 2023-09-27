CREATE DEFINER=`Admin1`@`%` PROCEDURE `CancelBooking`(IN BookingID INT)
BEGIN
DELETE FROM bookings WHERE booking_id = BookingID; SELECT CONCAT("Booking ", BookingID, " cancelled") AS "Confirmation"; 
END