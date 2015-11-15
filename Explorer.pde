/**
 * Explorer.java
 * A class to represent an Explorer Occupant in the maze game.
 * @author Brandon M. Kelley
 * @since October 22, 2015
 */

import java.awt.event.KeyEvent;

public class Explorer extends Occupant {
  
  private String name;
  private Maze maze;
  
  /**
   * Constructor that creates an Explorer with a maze
   * @param maze: the maze that the Explorer inhabits
   */
  public Explorer(Maze maze) {
    this.maze = maze;
  }
  
  /**
   * Constructor that initalizes each instance variable
   * @param location: the starting location of the Explorer
   * @param maze: the maze that the Explorer inhabits
   * @param name: the name of the Explorer
   */
  public Explorer(Square location, Maze maze, String name) {
    super(location);
    this.maze = maze;
    this.name = name;
    maze.lookAround(location);
  }

  /**
   * Name accessor
   * @return String: name of the Explorer
   */
  public String name() {
    return name;
  }

  /**
   * Move the Explorer in a direction specified by a key code
   * @param key: the key code of the direction to move
   */
  public void move(int key) {
    
    Square location = super.location();
    int row = location.row();
    int col = location.col();
    
    // Use keycode to figure out the direction of movement
    switch (key) {
      
      // Up
      case KeyEvent.VK_UP:
      case KeyEvent.VK_KP_UP:
        // If there's no wall, move to new location
        if (!location.wall(Square.UP)) {
          row--;
          Square newLocation = maze.getSquare(row, col);
          moveTo(newLocation);
        }
        break;
      
      // Right
      case KeyEvent.VK_RIGHT:
      case KeyEvent.VK_KP_RIGHT:
        // If there's no wall, move to new location
        if (!location.wall(Square.RIGHT)) {
          col++;
          Square newLocation = maze.getSquare(row, col);
          moveTo(newLocation);
        }
        break;
      
      // Down
      case KeyEvent.VK_DOWN:
      case KeyEvent.VK_KP_DOWN:
        // If there's no wall, move to new location
        if (!location.wall(Square.DOWN)) {
          row++;
          Square newLocation = maze.getSquare(row, col);
          moveTo(newLocation);
        }
        break;
      
      // Left
      case KeyEvent.VK_LEFT:
      case KeyEvent.VK_KP_LEFT:
        // If there's no wall, move to new location
        if (!location.wall(Square.LEFT)) {
          col--;
          Square newLocation = maze.getSquare(row, col);
          moveTo(newLocation);
        }
        break;
      
    }
    
  }
  
  /**
   * Move the Explorer
   * @param location: location to moved the Explorer to
   */
  @Override public void moveTo(Square location) {
    super.moveTo(location);
    location.enter();
    maze.lookAround(location);
  }
  
  /**
   * Create a String representation of this Object using the
   *   provided delimiter
   * @return String: the String representation of this Object
   */
  @Override public String toText(char delimiter) {
    String base = super.toText(delimiter);
    return base + delimiter + name;
  }
  
  /**
   * Read in contents of a file and create this
   * @param input: the Scanner used to read the input file
   */
  @Override public void toObject(Scanner input);
    
    // Fill in super class's instance variables
    super.toObject(input);
    
    // Try to initialize this Object
    try {
      name = input.next();
    } catch (MazeReadException e) {
      e.printStackTrace();
    }
    
  }
  
}
