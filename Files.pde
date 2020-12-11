
import java.io.PrintStream;
import java.io.FileNotFoundException;

import java.io.FileReader;
import java.io.BufferedReader;
import java.io.InputStreamReader;

import java.net.URL;


public class Files extends PApplet { 

  void settings() {
    size(1900, 600);
  } 
  void draw() {
    fill(255,0,0);
    char myChar = 0x266B;
    textSize(36);
    text(myChar, 100, 100);
    //readEarthquakes();
    readFile();
  } // end draw() 
  
  void readEarthquakes() {
    try {
      URL webpage = new URL("https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.csv");
      
      InputStreamReader stream = new InputStreamReader(webpage.openStream());

      
      BufferedReader reader = new BufferedReader(stream);

      int count = 0;
      while (reader.ready()) {
        count++;
        text("earthquake  " + count, 100, 100); 
        String line = reader.readLine();
        String[] parts = line.split(",");
       
          text(parts[1] + " " + parts[2] + " " + parts[4] + " " + parts[13], 100, 200 + 30 * count);
      
      
      } // end while
    } catch (IOException theException) {
      text("bad things happened:" + theException, 400, 400);
    } // end try-catch
  } // end readEarthquakes
  
  void readFile() {
    try {
      FileReader file = new FileReader("test.out");
      
      int x = file.read();
      text("the character read is " + x, 500, 100);
      
      BufferedReader reader = new BufferedReader(file);

      while (reader.ready()) {
        String line = reader.readLine();
        String[] parts = line.split(" ");
        for (int i=0; i<parts.length; i++) {
          text(parts[i], 100, 200 + 30 * i);
        } // end for
      } // end while
    } catch (IOException theException) {
      text("bad things happened:" + theException, 400, 400);
    } // end try-catch
  } // end readFile() 

  public static void main(String[] args) {

    try {
      PrintStream out = new PrintStream("test.out");

      char myChar = 0x145;
      System.out.println(myChar);
      out.println("this is a test: ");

      out.close();
    } 
    catch (FileNotFoundException theException) {
      System.out.println("problem writing to test.out" + theException.toString());
    } // end try-catch 



    PApplet.main("Files");
  } // end main()
}  // end class 