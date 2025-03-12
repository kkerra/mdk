using Task3;

IShape circle = new Circle();
circle = new RedShapeDecorator(circle);
circle = new GreenShapeDecorator(circle);
Console.WriteLine("Circle");
circle.Draw();

IShape redRectangle = new RedShapeDecorator(new Rectangle());
redRectangle.Draw();
Console.WriteLine("\nRectangle of red border");

IShape greenCircle = new GreenShapeDecorator(new Circle());
Console.WriteLine("\nCircle of green border");
greenCircle.Draw();