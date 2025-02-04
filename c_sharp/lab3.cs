using Task1;

// NOTE: All classes are defined in ./Lab3Task1Classes.cs

/* 1a. Create the following classes:
 *  -   Person with fields: FirstName, LastName, Age, a constructor initializing all fields, and a method View()
 *  -   Book with fields: Title, Author (of type Person), PublicationDate, and a method View()
 *  Create various objects of these classes and execute the View() methods. */

Person george = new Person("George R. R.", "Martin", 76);
Console.WriteLine(george.View());       // Person: George R. R. Martin, aged 76 years old.

Book got = new Book("A Game of Thrones", "August 1, 1996", george);
Console.WriteLine(got.View());          // Book: A Game of Thrones, published August 1, 1996, written by George R. R. Martin


/*  1b.  Create a class Reader that inherits from the Person class. 
 *  Additionally, the Reader class should have a field – a list/array of Book objects, representing books read by the reader. 
 *  Implement a method ViewBook() – which prints the titles of books that the reader has read.
 *  Create 3–5 books and 2–4 readers. 
 *  Assign books to each reader’s read books list/array and execute the ViewBook() methods. */

Person someAuthor = new Person("Jane", "Doe", 100);     // dummy author

Book got = new Book("A Game of Thrones", "August 1, 1996", george);
Book gg = new Book("The Great Gatsby", "April 10, 1925", someAuthor);
Book pap = new Book("Pride and Prejudice", "January 28, 1813", someAuthor);
Book cap = new Book("Crime and Punishment", "December 1866", someAuthor);
Book lotr = new Book("The Lord of the Rings", "July 29, 1954", someAuthor);

Book[] booksR1 = { got, pap, lotr};
Book[] booksR2 = { gg, pap, cap,  lotr };

Reader reader1 = new Reader("Jan", "Kowalski", 1, booksR1);
Reader reader2 = new Reader("Max", "Musterman", 1, booksR1);
reader1.ViewBook();
reader2.ViewBook();

/* OUTPUT:
    Books saved by Jan Kowalski:
        - A Game of Thrones
        - Pride and Prejudice
        - The Lord of the Rings
    Books saved by Max Musterman:
        - A Game of Thrones
        - Pride and Prejudice
        - The Lord of the Rings */


/*  1c. Add a View() method to the Reader class, which, besides 
 *  displaying the reader's details (same as Person.View()), also prints 
 *  the list of books read by the reader (use the already existing ViewBook() method). */

reader1.View();

/*  OUTPUT:
*  Reader: Jan Kowalski, aged 1 years old.
*  Books saved by Jan Kowalski:
*        -A Game of Thrones
*        - Pride and Prejudice
*        - The Lord of the Rings */

/*  1d. Modify the View() methods in the Person and Reader classes using appropriate keywords so that executing the following code:
*       Person o = new Reader(...);
*       o.View();
*   calls the View() method from the Reader class. */

// SOLUTION: I used 'virtual' keyword in the 'Person' class

/*  1e. Change the visibility of the fields in the Person class to private. If necessary, modify the Reader.View() 
 *  method so that its output remains unchanged. Use properties if needed. */

// SOLUTION: I changed properities of a base class to Protected, so that they still can be accessible from a Reader class