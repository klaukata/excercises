/*  1. Write a class Person that stores information about a person's first name, 
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