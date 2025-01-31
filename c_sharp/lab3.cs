// NOTE: All classes are defined in ./Lab3Task1Classes.cs

/* 1a. Create the following classes:
 *  -   Person with fields: FirstName, LastName, Age, a constructor initializing all fields, and a method View()
 *  -   Book with fields: Title, Author (of type Person), PublicationDate, and a method View()
 *  Create various objects of these classes and execute the View() methods. */

using Task1;

Person george = new Person("George R. R.", "Martin", 76);
Console.WriteLine(george.View());       // Person: George R. R. Martin, aged 76 years old.

Book got = new Book("A Game of Thrones", "August 1, 1996", george);
Console.WriteLine(got.View());          // Book: A Game of Thrones, published August 1, 1996, written by George R. R. Martin

