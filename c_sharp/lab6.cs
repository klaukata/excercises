// 1.   Write a program that saves the student ID number of the person who wrote the program to a file with a specified name.
class Program
{
    static void Main()
    {
        Console.Write("Enter your student ID: ");
        string studentId = Console.ReadLine();

        Console.Write("Enter the .txt file name to save the ID (fill path, extension included): ");
        string fileName = Console.ReadLine();

        try
        {
            File.WriteAllText(fileName, studentId);
            Console.WriteLine($"Studet ID has been saved successfuly to {fileName}");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error: {ex.Message}");
        }
    }
}

// 2.   Write a program that reads the contents of a file with a specified name.

class Program
{
    static void Main()
    {
        Console.Write("Enter the file name to read the contents from (fill path, extension included): ");
        string fileName = Console.ReadLine();

        if (File.Exists(fileName)) 
        {
            try
            {
                string content = File.ReadAllText(fileName);
                Console.WriteLine($"Content of a file {fileName}: \n{content}");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
            }
        }
        else
        {
            Console.WriteLine("Provided file does not exists.");
        }
        
    }
}