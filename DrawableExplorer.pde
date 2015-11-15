/**
 * DrawableExplorer.java
 * A class to represent an Explorer in the Maze who is
 * Drawable.
 * @author Brandon M. Kelley
 * @since October 23, 2015
 */
public class DrawableExplorer extends Explorer implements Drawable {
  
  /**
   * Constructor to initialize inherited instance variables
   * @param location: this Explorer's starting square
   * @param maze: the maze this Explorer is in
   * @param name: the name of this Explorer
   */
  public DrawableExplorer(Square location, Maze maze, String name) {
    super(location, maze, name);
  }

  /**
   * Draw the Explorer
   */
  public void draw() {
    
    noStroke();
    fill(255, 255, 0);
    
    arc((float) (super.location().x()) + Square.SQUARE_SIZE / 2,
        (float) (super.location().y()) + Square.SQUARE_SIZE / 2,
        Square.SQUARE_SIZE / 2,
        Square.SQUARE_SIZE / 2,
        QUARTER_PI, TWO_PI - QUARTER_PI);
    
  }
  
}
