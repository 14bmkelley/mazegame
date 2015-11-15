/**
 * RandomOccupant.java
 * A class to represent an Occupant whose actions are 
 * randomized.
 * @author Brandon M. Kelley
 * @since October 22, 2015
 */

import java.util.Random;
import java.util.Scanner;

public class RandomOccupant extends Occupant {
  
  private Random random;
  private Maze maze;

  /**
   * Constructor that initializes all instance variables
   * @param maze: the maze that this Occupant is in
   */
  public RandomOccupant(Maze maze) {
    super();
    random = new Random();
    this.maze = maze;
    randomizeLocation();
  }

  /**
   * Constructor that initializes all instance variables
   * and considers a seed when randomizing
   * @param maze: the maze that this Occupant is in
   * @param seed: the seed value to use for randomizing
   */
  public RandomOccupant(Maze maze, long seed) {
    super();
    random = new Random(seed);
    this.maze = maze;
    randomizeLocation();
  }

  /**
   * Constructor that initializes all instance variables
   * without randomizing location
   * @param maze: the maze that this Occupant is in
   * @param location: the location the Occupant starts at
   */
  public RandomOccupant(Maze maze, Square location) {
    super(location);
    random = new Random();
    this.maze = maze;
  }
  
  /**
   * Randomize the movement of this Occupant
   */
  public void move() {
    
    // Get location information
    Square location = super.location();
    int row = location.row();
    int col = location.col();
    
    // Randomize a direction to move
    int direction;
    
    do {
      direction = random.nextInt(4);
    } while (location.wall(direction));
    
    Square newLocation;

    // Process the chosen direction
    switch (direction) {
      
      case Square.UP:
        row--;
        newLocation = maze.getSquare(row, col);
        super.moveTo(newLocation);
        break;

      case Square.RIGHT:
        col++;
        newLocation = maze.getSquare(row, col);
        super.moveTo(newLocation);
        break;

      case Square.DOWN:
        row++;
        newLocation = maze.getSquare(row, col);
        super.moveTo(newLocation);
        break;

      case Square.LEFT:
        col--;
        newLocation = maze.getSquare(row, col);
        super.moveTo(newLocation);
        break;
        
    }

  }
  
  /**
   * Randomize the location of this Occupant
   */
  private void randomizeLocation() {
    int row = random.nextInt(maze.rows());
    int col = random.nextInt(maze.cols());
    Square location = maze.getSquare(row, col);
    super.moveTo(location);
  }
  
  /**
   * Read in contents of a file and create this
   * @param input: the Scanner used to read the input file
   */
  @Overridepublic void toObject(Scanner input) {
    
    // Try to initialize this Object
    try {
      int row = input.nextInt();
      int col = input.nextInt();
      Square location = maze.getSquare(row, col);
      super.moveTo(location);
    
    // Print exception
    } catch (MazeReadException e) {
      e.printStackTrace();
    }
    
  }
  
}
