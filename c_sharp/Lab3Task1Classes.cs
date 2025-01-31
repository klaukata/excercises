namespace Task1
{
    //  TASK 1A RELATED
    public class Person
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int Age { get; set; }

        public Person(string firstName, string lastName, int age)
        {
            FirstName = firstName;
            LastName = lastName;
            Age = age;
        }

        public string View()
        {
            return $"Person: {FirstName} {LastName}, aged {Age} years old.";
        }
    }
    public class Book
    {
        public string Title { get; set; }
        public string PublicationDate { get; set; }
        public Person Author { get; set; }

        public Book(string title, string publicationDate, Person author)
        {
            Title = title;
            PublicationDate = publicationDate;
            Author = author;
        }

        public string View()
        {
            return $"Book: {Title}, published {PublicationDate}, written by {Author.FirstName} {Author.LastName}";
        }
    }

    
}