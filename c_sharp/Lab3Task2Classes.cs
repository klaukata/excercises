namespace Task2
{
    class Car
    {
        public string Brand { get; set; }
        public string Model { get; set; }
        public string BodyType { get; set; }
        public string Color { get; set; }
        public int Year { get; set; }
        public double _mileage;

        public double Mileage
        {
            get => _mileage;
            set => _mileage = value >= 0 ? value : throw new ArgumentException("Mileage can't be a negative number");
        }

        public Car(string brand, string model, string bodyType, string color, int year, double mileage)
        {
            Brand = brand;
            Model = model;
            BodyType = bodyType;
            Color = color;
            Year = year;
            Mileage = mileage;
        }

        public virtual void ShowInfo()
        {
            Console.WriteLine($"{Brand} {Model}, {BodyType}, {Color}, {Year}, {Mileage} km");
        }
    }
    class PassengerCar : Car
    {
        public int NumPassengers { get; set; }
        public double _weight;
        public double Weight
        {
            get => _weight;
            set => _weight = value >= 2 && value <= 4.5 ? value : throw new ArgumentException("Weight of a vehicle has to be within arange <2; 4.5>");
        }
        public double _engineCapacity;
        public double EngineCapacity
        {
            get => _engineCapacity;
            set => _engineCapacity = value >= 0.8 && value <= 3.0 ? value : throw new ArgumentException("A value of engine capacity has to be within a range <0.8; 3.0>");
        }
        public PassengerCar(string brand, string model, string bodyType, string color, int year, double mileage, double weight, double engineCapacity, int numPassengers) : base(brand, model, bodyType, color, year, mileage)
        {
            Weight = weight;
            EngineCapacity = engineCapacity;
            NumPassengers = numPassengers;
        }
        public override void ShowInfo()
        {
            base.ShowInfo();
            Console.WriteLine($"Number of passengers: {NumPassengers}, weight: {Weight}, engine capacity: {EngineCapacity}");
        }
    }
}