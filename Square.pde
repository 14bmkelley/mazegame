/**
 * Square.java
 * A class used to represent each square in the maze game.
 * @author Brandon M. Kelley
 * @since October 22, 2015
 */
public class Square {
  
  public static final int SQUARE_SIZE = 50;
  public static final int WALL_SIZE = 5;
  public static final int UP = 0;
  public static final int RIGHT = 1;
  public static final int DOWN = 2;
  public static final int LEFT = 3;

  private boolean[] hasWalls;
  private boolean seen;
  private boolean inView;
  private int row, col;
  private Treasure treasure;
  
  /**
   * Square constructor that only has a location
   * @param row: the row of this square on the maze
   * @param col: the column of this square on the maze
   */
  public Square(int row, int col) {
    hasWalls = new boolean[] { false, false, false, false };
    seen = false;
    inView = false;
    this.row = row;
    this.col = col;
    treasure = null;
  }
  
  /**
   * Square constructor which customizes a square for use in the maze.
   * @param up: whether the top of the square has a wall
   * @param right: whether the right of the square has a wall
   * @param down: whether the bottom of the square has a wall
   * @param left: whether the left of the square has a wall
   * @param row: the row of this square on the maze
   * @param col: the column of this square on the maze
   */
  public Square(boolean up, boolean right, boolean down, boolean left, int row, int col) {
    hasWalls = new boolean[] { up, right, down, left };
    seen = false;
    inView = false;
    this.row = row;
    this.col = col;
    treasure = null;
  }
  
  /**
   * Check whether there is a wall in the given direction
   * @param direction: the direction to check for a wall
   * @return boolean: whether there is a wall in the given direction
   */
  public boolean wall(int direction) {
    if (direction < 4) {
      return hasWalls[direction];
    }
    return true;
  }

  /**
   * Seen accessor
   * @return boolean: whether this square has been seen
   */
  public boolean seen() {
    return seen;
  }

  /**
   * InView accessor
   * @return boolean: whether this square is currently in view
   */
  public boolean inView() {
    return inView;
  }

  /**
   * InView mutator
   * @param inView: whether this square is in view of the explorer
   */
  public void setInView(boolean inView) {
    this.inView = inView;
    if (inView) seen = true;
  }

  /**
   * Row accessor
   * @return int: the row where this square is located
   */
  public int row() {
    return row;
  }

  /**
   * Col accessor
   * @return int: the column where this square is located
   */
  public int col() {
    return col;
  }

  /**
   * Treasure accessor
   * @return Treasure: the treasure (if any) this square contains
   */
  public Treasure treasure() {
    return treasure;
  }

  /**
   * Treasure mutator
   * @param t: treasure to be set to this square
   */
  public void setTreasure(Treasure t) {
    treasure = t;
  }

  /**
   * Find the x pixel for the top-left corner of this square
   * @return int: top-left x-coordinate
   */
  public int x() {
    return col * SQUARE_SIZE;
  }

  /**
   * Find the y pixel for the top-left corner of this square
   * @return int: top-left y-coordinate
   */
  public int y() {
    return row * SQUARE_SIZE;
  }

  /**
   * Register that the explorer has entered this square
   */
  public void enter() {
    if (treasure != null) {
      treasure.setFound();
    }
  }
  
  /**
   * Create a String representation of this Object using the
   *   provided delimiter
   * @return String: the String representation of this Object
   */
  public String toText(char delimiter) {
    
    // Create result as a StringBuilder
    StringBuilder result = new StringBuilder();
    
    // Append name and location
    result.append(getClass().getName() + delimiter);
    result.append(row + delimiter);
    result.append(col + delimiter);
    
    // Append wall booleans
    for (int i = 0; i < hasWalls.length; i++) {
      result.append((hasWalls[i]) ? "true" : "false");
      result.append(delimiter);
    }
    
    // Append seen
    if (seen) {
      result.append("true");
    } else {
      result.append("false");
    }
    result.append(delimiter);
    
    // Append inView
    if (inView) {
      result.append("true");
    } else {
      result.append("false");
    }
    
    return result.toString();
    
  }
  
  /**
   * Read in contents of a file and create this
   * @param input: the Scanner used to read the input file
   */
  public void toObject(Scanner input) {
    
    // Try to initialize this Object
    try {
      hasWalls[0] = input.nextBoolean();
      hasWalls[1] = input.nextBoolean();
      hasWalls[2] = input.nextBoolean();
      hasWalls[3] = input.nextBoolean();
      seen = input.nextBoolean();
      inView = input.nextBoolean();
    
    // Print exception
    } catch (MazeReadException e) {
      e.printStackTrace();
    }
    
  }
  
}
