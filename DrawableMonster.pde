/**
 * DrawableMonster.java
 * A class to represent a Monster in the Maze that is
 * Drawable.
 * @author Brandon M. Kelley
 * @since October 23, 2015
 */
public class DrawableMonster extends Monster implements Drawable {
  
  /**
   * Constructor that randomly places a Monster in the Maze
   * @param maze: the maze this Monster belongs to
   */
  public DrawableMonster(Maze maze) {
    super(maze);
  }

  /**
   * Constructor that randomly places a Monster in the Maze
   * using a seed for the randomizer
   * @param maze: the maze this Monster belongs to
   * @param seed: the seed to be used for randomizing
   */
  public DrawableMonster(Maze maze, long seed) {
    super(maze, seed);
  }

  /**
   * Constructor that places the Monster at a start location
   * @param maze: the maze this Monster belongs to
   * @param start: the Square to start this Monster in
   */
  public DrawableMonster(Maze maze, Square start) {
    super(maze, start);
  }

  /**
   * Draw the Monster
   */
  public void draw() {
    
    if (super.location().inView()) {
      
      pushMatrix();
      translate(super.location().x() + Square.SQUARE_SIZE / 2, super.location().y() + Square.SQUARE_SIZE / 2);
      
      noStroke();
      
      // Body
      fill(255, 0, 0);
      ellipse(0, -5, 30, 30);
      quad(-15, -10, 15, -10, 15, 12.5, -15, 12.5);
      triangle(-15, 12, -8, 12, -15, 20);
      triangle(-10, 12, 0, 12, -5, 20);
      triangle(0, 12, 10, 12, 5, 20);
      triangle(15, 12, 8, 12, 15, 20);
      
      // Eyes
      fill(255);
      ellipse(-5, -7, 10, 12);
      ellipse(9, -7, 10, 12);
      fill(20, 0, 230);
      ellipse(-3, -6, 6, 6);
      ellipse(11, -6, 6, 6);
      
      popMatrix();
      
    }
      
  }
  
}
