using LabWork16;


var visitorService = new VisitorService();
var ticketService = new TicketService();

var visitors = await visitorService.GetVisitorsAsync();
foreach (var visitor in visitors)
    Console.WriteLine($"{visitor.VisitorId} {visitor.Name}");

var tickets = await ticketService.GetTicketsAsync();
foreach (var ticket in tickets)
    Console.WriteLine($"{ticket.TicketId} {ticket.VisitorId} {ticket.Row} {ticket.Place}");

//await visitorService.AddVisitorAsync(new Visitor { Phone = "123456", Name="test", Email="123123" });
//await ticketService.AddTicketAsync(new Ticket { VisitorId = 2, SessionId = 3, Place = 1, Row = 3 });

//await visitorService.UpdateVisitorAsync(new Visitor { Name = "test1" }, 3);
//await ticketService.UpdateTicketAsync(new Ticket { Place = 10 }, 3);

await visitorService.DeleteVisitorAsync(9);
await ticketService.DeleteTicketAsync(30);