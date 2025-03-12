using Task2;

ShapeFactory shapeFactory = new();

//get an object of Circle and call its draw method.
IShape shape1 = shapeFactory.GetShape("CIRCLE");
shape1.Draw();

//get an object of Rectangle and call its draw method.
IShape shape2 = shapeFactory.GetShape("RECTANGLE");
shape2.Draw();

//get an object of Square and call its draw method.
IShape shape3 = shapeFactory.GetShape("SQUARE");
shape3.Draw();

IShape shape4 = shapeFactory.GetShape("triangle");
shape4.Draw();