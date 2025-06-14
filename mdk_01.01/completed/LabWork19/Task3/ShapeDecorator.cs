﻿namespace Task3
{
    abstract class ShapeDecorator : IShape
    {
        protected IShape decoratedShape;

        public ShapeDecorator(IShape decoratedShape) 
            => this.decoratedShape = decoratedShape;

        public virtual void Draw()
            => decoratedShape.Draw();
    }
}
