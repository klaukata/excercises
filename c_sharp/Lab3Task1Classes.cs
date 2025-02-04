namespace Task1
{
    //  TASK 1A RELATED
    public class Person
    {
        protected string FirstName { get; set; } 
        protected string LastName { get; set; }
        protected int Age { get; set; }

        public Person(string firstName, string lastName, int age)
        {
            FirstName = firstName;
            LastName = lastName;
            Age = age;
        }

        public virtual string View()
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
            return $"Book: {Title}, published {PublicationDate}, written by {Author.View()}";
        }
    }

    // TASK 1B RELATED
    public class Reader : Person
    {
        private Book[] Books;

        public Reader(string FirstName, string LastName, int Age, Book[] books) : base(FirstName, LastName, Age)
        {
            Books = books;
        }
        public void ViewBook()
        {
            foreach (Book book in Books)
            {
                Console.WriteLine($"\t- {book.Title}");
            }
        }

        // TASK 1C RELATED
        public override string View() 
        {
            ViewBook();
            return $"Reader: {FirstName} {LastName}, aged {Age} years old.";
            
        }
    }
    
}