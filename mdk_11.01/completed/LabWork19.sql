CREATE FUNCTION GetDateTimeByTicketId
(
	@ticketId INT
)
RETURNS DATETIME
AS
BEGIN 
	DECLARE @dateTime DATETIME;
	SELECT @dateTime = [DateTime]
	FROM Ticket INNER JOIN
         Session ON Ticket.SessionId = Session.SessionId
	WHERE TicketId = @ticketId

	RETURN @dateTime
END;

CREATE PROCEDURE GetTicketByPhone
(
	@phone CHAR(10)
)
AS
BEGIN
	SELECT * 
	FROM Visitor INNER JOIN
         Ticket ON Visitor.VisitorId = Ticket.VisitorId
	WHERE Phone = @phone
END;