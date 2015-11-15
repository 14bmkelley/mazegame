/**
 * DelimitedTextIO.java
 * An interface used to convert Objects to and
 *   from String form
 * @author Brandon M. Kelley
 * @since November 14, 2015
 */
public interface DelimitedTextIO {
  
  /**
   * Converts an Object to a string delimited with the chosen
   *   delimiter
   * @param delimiter: the delimiter to use in the String
   *   representation of the Object
   * @return String: the String representation of the Object
   *   this function is called on
   */
  String toText(char delimiter);
  
  /**
   * Reads a file to initialize the Object this function is
   *   called on
   * @param input: the scanner used to read input file
   */
  void toObject(Scanner input);
  
}
