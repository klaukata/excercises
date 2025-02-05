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
        protected Book[] GetBooks => Books; // getter name = ReadBooks, returns a private filed Books (task 1f related) 

        public Reader(string FirstName, string LastName, int Age, Book[] books) : base(FirstName, LastName, Age)
        {
            Books = books;
        }
        public string ViewBook()
        {
            string retStr = "";
            foreach (Book book in Books)
            {
                retStr += $"\t- {book.Title}\n";
            }
            return retStr
        }

        // TASK 1C RELATED
        public override string View() 
        {
            return $"Reader: {FirstName} {LastName}, aged {Age} years old, has read the following books:\n{ViewBook()}";
            
        }
    }
    
}