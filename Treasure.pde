/**
 * Treasure.java
 * A class to represent a piece of treasure that acts as
 * a RandomOccupant in the maze
 * @author Brandon M. Kelley
 * @since October 22, 2015
 */
public class Treasure extends RandomOccupant {
  
  private boolean found;

  /**
   * Constructor that randomly places the Treasure
   * @param maze: the maze this Treasure belongs to
   */
  public Treasure(Maze maze) {
    super(maze);
    found = false;
    location().setTreasure(this);
  }

  /**
   * Constructor that randomly places the Treasure using
   * a seed for the randomizer
   * @param maze: the maze this Treasure belongs to
   * @param seed: the seed to be used for randomizing
   */
  public Treasure(Maze maze, long seed) {
    super(maze, seed);
    found = false;
    location().setTreasure(this);
  }

  /**
   * Constructor that places the Treasure at a start location
   * @param maze: the maze this Treasure belongs to
   * @param start: the Square to start this Treasure in
   */
  public Treasure(Maze maze, Square start) {
    super(maze, start);
    found = false;
    start.setTreasure(this);
  }

  /**
   * Found accessor
   * @return boolean: whether or not the treasure has
   * been found
   */
  public boolean found() {
    return found;
  }

  /**
   * Found mutator
   */
  public void setFound() {
    found = true;
  }

  /**
   * Location mutator
   */
  public void move() {
    // Do nothing
  }
  
  /**
   * Location mutator
   * @param newLoc: the new location to be set
   */
  @Override public void moveTo(Square newLoc) {
    
    // Get the current location and remove its treasure
    Square location = location();
    if (location != null) {
      location.setTreasure(null);
    }
    
    // Move to new location and set treasure
    super.moveTo(newLoc);
    newLoc.setTreasure(this);
    
  }
  
  /**
   * Create a String representation of this Object using the
   *   provided delimiter
   * @return String: the String representation of this Object
   */
  @Override public String toText(char delimiter) {
    
    // Get string from super class's instance variables
    String base = super.toText(delimiter) + delimiter;
    
    // Get value of found as a String
    if (found) {
      return base + "true";
    }
    return base + "false";
    
  }
  
  /**
   * Read in contents of a file and create this
   * @param input: the Scanner used to read the input file
   */
  @Override public void toObject(Scanner input) {
    
    // Fill in super class's
    super.toObject(input);
    
    // Try to initialize this Object
    try {
      found = input.nextBoolean();
    } catch (MazeReadException e) {
      e.printStackTrace();
    }
    
  }
  
}
