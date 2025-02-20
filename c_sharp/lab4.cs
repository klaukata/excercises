/* 1.   Implement the Shape class, which has the properties X, Y, Height, Width, and a virtual method Draw.
   Then, implement the following classes:
    - Rectangle
    - Triangle
    - Circle
    Each of these classes should override the Draw method by printing to the console which shape is being drawn.
    Finally, write a program that adds an instance of each derived class to a List<Shape> and calls the Draw method for each element in the list. */

class Shape
{
    public int X { get; set; }
    public int Y { get; set; }
    public int Height { get; set; }
    public int Width { get; set; }
    public virtual void Draw()
    {
        Console.WriteLine("Drawing a shape...");
    }

}

class Rectangle : Shape
{
    public override void Draw()
    {
        Console.WriteLine($"Drawing a rectangle in area ({X}, {Y}) with dimentions {Width}x{Height}");
    }
}

class Triangle : Shape
{
    public override void Draw()
    {
        Console.WriteLine($"Drawing a triangle in area ({X}, {Y}) with dimentions {Width}x{Height}");
    }
}

class Circle : Shape
{
    public override void Draw()
    {
        Console.WriteLine($"Drawing a circle in area ({X}, {Y}) with dimentions {Width}x{Height}");
    }
}

class Program
{
    static void Main()
    {
        List<Shape> shapes = new List<Shape>
        {
            new Rectangle { X = 10, Y = 20, Width = 30, Height = 40 },
            new Triangle { X = 15, Y = 25, Width = 20, Height = 35 },
            new Circle { X = 5, Y = 10, Width = 50, Height = 50 }
        };
        foreach (var shape in shapes)
        {
            shape.Draw();
        }
    }
}

//  OUTPUT:
//  Drawing a rectangle in area (10, 20) with dimentions 30x40
//  Drawing a triangle in area (15, 25) with dimentions 20x35
//  Drawing a circle in area (5, 10) with dimentions 50x50