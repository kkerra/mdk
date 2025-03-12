--task4
SELECT *
FROM Visitor
FOR JSON PATH, INCLUDE_NULL_VALUES

SELECT Phone, SessionId, TicketId, Place, Row
FROM Ticket 
     INNER JOIN Visitor ON Ticket.VisitorId = Visitor.VisitorId
FOR JSON PATH, INCLUDE_NULL_VALUES


--task5
SELECT *
FROM Visitor
FOR XML PATH ('Visitor'), ROOT ('Visitors')

SELECT TicketId '@ticketId', Phone, SessionId, Place, Row
FROM Ticket 
     INNER JOIN Visitor ON Ticket.VisitorId = Visitor.VisitorId
FOR XML PATH ('Ticket'), ROOT ('Tickets')