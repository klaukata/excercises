namespace Oop
{
    public class Count
    {
        private double currentValue;

        // constructor
        public Count(double num)
        {
            currentValue = num;
        }
        public void Add(double num)
        {
            currentValue += num;
        }
        public void Subtract(double num)
        {
            currentValue -= num;
        }
        public void PrintState()
        {
            Console.WriteLine($"Current value = {currentValue}");
        }
    }
}