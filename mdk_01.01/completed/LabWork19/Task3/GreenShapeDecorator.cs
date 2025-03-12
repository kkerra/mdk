
namespace Task3
{
    internal class GreenShapeDecorator : ShapeDecorator
    {
        public GreenShapeDecorator(IShape decoratedShape) : base(decoratedShape) { }

        public override void Draw()
        {
            base.Draw();
            SetGreenBorder(decoratedShape);
        }

        private void SetGreenBorder(IShape decoratedShape)
            => Console.WriteLine("Border Color: Green");
    }
}
