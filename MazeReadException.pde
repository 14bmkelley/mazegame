/**
 * MazeReadException.java
 * A class to represent an exception thrown when
 *   when the maze cannot be read.
 * @author Brandon M. Kelley
 * @since November 14, 2015
 */

import java.lang.Exception;

public class MazeReadException {
  
  private String line;
  private int lineNumber;
  
  /**
   * Constructor to initialize all instance variables
   * @param message: message to be displayed
   * @param line: the line of code where the exception occured
   * @param lineNumber: line number where the exception occured
   */
  public MazeReadException(String message, String line, int lineNumber) {
    super(message);
    this.line = line;
    this.lineNumber = lineNumber;
  }
  
  /**
   * line accessor
   * @return String: the line where the exception occured
   */
  public String getLine() {
    return line;
  }
  
  /**
   * lineNumber accessor
   * @return int: the line number where the exception occured
   */
  public int getLineNum() {
    return lineNumber;
  }
  
}
