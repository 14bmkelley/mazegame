/**
 * DrawableTreasure.java
 * A class to represent a Treasure in the Maze that is
 * Drawable.
 * @author Brandon M. Kelley
 * @since October 23, 2015
 */
public class DrawableTreasure extends Treasure implements Drawable {
  
  /**
   * Constructor that randomly places the Treasure
   * @param maze: the maze this Treasure belongs to
   */
  public DrawableTreasure(Maze maze) {
    super(maze);
  }

  /**
   * Constructor that randomly places the Treasure using
   * a seed for the randomizer
   * @param maze: the maze this Treasure belongs to
   * @param seed: the seed to be used for randomizing
   */
  public DrawableTreasure(Maze maze, long seed) {
    super(maze, seed);
  }

  /**
   * Constructor that places the Treasure at a start location
   * @param maze: the maze this Treasure belongs to
   * @param start: the Square to start this Treasure in
   */
  public DrawableTreasure(Maze maze, Square start) {
    super(maze, start);
  }

  /**
   * Draw the treasure
   */
  public void draw() {
    
    if (super.location().seen()) {
      
      if (super.found()) {
        fill(0);
      } else {
        fill(0, 0, 255);
      }
      
      ellipse(super.location().x() + Square.SQUARE_SIZE / 2,
              super.location().y() + Square.SQUARE_SIZE / 2,
              Square.SQUARE_SIZE / 2, Square.SQUARE_SIZE / 2);
      
    }
    
  }

}
