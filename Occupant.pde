/**
 * Occupant.java
 * An abstract class to represent any maze occupant.
 * @author Brandon M. Kelley
 * @since October 22, 2015
 */
public abstract class Occupant {
  
  private Square location;

  /**
   * A default constructor
   */
  public Occupant() {
    location = null;
  }

  /**
   * A constructor to initialize the Occupant's location
   * @param start: the Square that the Occupant starts on
   */
  public Occupant(Square start) {
    location = start;
  }

  /**
   * Location accessor
   * @return Square: the location of the Occupant
   */
  public Square location() {
    return location;
  }

  /**
   * Location mutator
   * @param newLoc: the new location to be set
   */
  public void moveTo(Square newLoc) {
    location = newLoc;
  }
  
  /**
   * Create a String representation of this Object using the
   *   provided delimiter
   * @return String: the String representation of this Object
   */
  public String toText(char delimiter) {
    
    // Append class name
    String result = getClass().getName() + delimiter
    
    // Append location
    result += location.row() + delimiter + location.col();
    
    return result;
    
  }
  
  /**
   * Read in contents of a file and create this
   * @param input: the Scanner used to read the input file
   */
  public void toObject(Scanner input) {
    // Can't do anything here. Check a subclass.
  }
  
}
