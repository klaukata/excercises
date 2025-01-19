/*  1.  Write a class Person that stores information about a person's first name, 
*   last name, and age. Implement a constructor that accepts all three values.
*   Use the properties Name, Surname, and Age with validation:
*   -   Name and Surname must be at least 2 characters long.
*   -   Age must be a positive number.
*   Implement a method ShowInfo() that displays the person's information. */

namespace Oop
{
    public class Person
    {
        // public fields
        public string name, surname;
        public int age;

        // constructor
        public Person(string name, string surname, int age)
        {
            if (string.IsNullOrWhiteSpace(name) || name.Length < 2) {
                throw new ArgumentException("Name must have at least 2 characters.", nameof(name));
            }
            if (string.IsNullOrWhiteSpace(surname) || surname.Length < 2) {
                throw new ArgumentException("Surname must have at least 2 characters.", nameof(surname));
            }
            if (age < 0)
            {
                throw new ArgumentException("Age cannot be a negative number", nameof(age));
            }
            this.name = name;
            this.surname = surname;
            this.age = age;
        }

        // ShowInfo method
        public void ShowInfo()
        {
            Console.WriteLine($"This person's name is {name} {surname}, and they are {age} years old.");
        }
    }
}


/*  2.  Write a class BankAccount that simulates a bank account.
 *  -   Implement properties Balance(public, read-only) and Owner
 *  -   Add a method Deposit(decimal) to increase the balance, and a method Withdrawal(decimal) 
        to check if there are sufficient funds and then deduct the appropriate amount.
*   -   Use access modifiers to protect the balance from direct modification. */

namespace Oop
{
    public class BankAccount
    {
        // Private field to hold the account balance
        private decimal balance;

        // Read-only public property to expose the balance
        public decimal Balance
        {
            get { 
                return balance;
            }
        }

        public string Owner { get; }

        public BankAccount(decimal initBalance, string owner)
        {   
            if (initBalance < 0 )
            {
                throw new ArgumentException("Initial balance cannot be negative.", nameof(initBalance));
            }
            if (string.IsNullOrWhiteSpace(owner))
            {
                throw new ArgumentException("Owner name cannot be null or empty.", nameof(owner));
            }
            balance = initBalance;
            Owner = owner;
        }

        // Method to deposit money into the account
        public void Deposit(decimal amount)
        {
            if (amount <= 0 )
            {
                throw new ArgumentException("Deposit amount must be greater than zero.", nameof(amount));
            }
            balance += amount;
        }

        // Method to withdraw money from the account
        public void Withdrawal(decimal amount)
        {
            if (amount <= 0 )
            {
                throw new ArgumentException("Withdrawal amount must be greater than zero.");
            }
            if (amount > balance)
            {
                throw new InvalidOperationException("Insufficient funds.");
            }
            balance -= amount;
        }
    }
}

/*  3. Write a class Student that stores the first name, last name, and an array of grades.
    -   Implement a property AverageGrades to calculate and return the average of the grades.
    -   Add a method AddGrade(int grade) to add a new grade to the array.
    -   Implement a constructor that initializes the student's first name and last name. */

public class Student
{
    public string Name;
    public string Surname;
    public List<int> GradesArray = new List<int>();

    public Student(string name, string surname)
    {
        if (string.IsNullOrWhiteSpace(name))
        {
            throw new ArgumentException("Name of a student cannot be null or empty.", nameof(name));
        }
        if (string.IsNullOrWhiteSpace(surname))
        {
            throw new ArgumentException("Surname of a student cannot be null or empty.", nameof(surname));
        }
        Name = name;
        Surname = surname;
    }

    // Method to add a grade to the student's list of grades
    public void AddGrade(int newGrade)
    {
        if (newGrade < 0 || newGrade > 6)
        {
            throw new ArgumentException("Each grade should be within range <0;6>");
        }
        GradesArray.Add(newGrade);
        Console.WriteLine($"Grade {newGrade} has been added.");
    }

    // Method to calculate and return the average grade of the student
    public double AverageGrades()
    {
        if (GradesArray.Count == 0)
        {
            throw new InvalidOperationException("Student has no grades so far.");
        }
        double sum = 0;
        foreach( int grade in GradesArray )
        {
            sum += grade;
        }
        double averageGrade = sum / GradesArray.Count;
        Console.WriteLine($"Average grade for student {Name} {Surname} is equal to {averageGrade}");
        return averageGrade;
    }
}