/**
 * DrawableMaze.java
 * A class to represent a Maze game that is Drawable.
 * @author Brandon M. Kelley
 * @since October 23, 2015
 */
public class DrawableMaze extends Maze implements Drawable {
  
  /**
   * Constructor that initializes al instance variables
   * @param squares: the Maze as an array of Squares
   * @param rows: number of rows in the Maze
   * @param cols: number of columns in the Maze
   */
  public DrawableMaze(DrawableSquare[][] squares, int rows, int cols) {
    super(squares, rows, cols);
  }

  /**
   * Draw the Maze
   */
  public void draw() {
   
    // Draw Squares
    for (int j = 0; j < super.rows(); j++) {
      for (int i = 0; i < super.cols(); i++) {
        DrawableSquare s = (DrawableSquare) super.getSquare(i, j);
        s.draw();
      }
    }

    // Draw RandomOccupants
    for (int i = 0; i < super.getNumRandOccupants(); i++) {
      ((Drawable) super.getRandomOccupant(i)).draw();
    }

    // Draw Explorer
    ((DrawableExplorer) super.getExplorer()).draw();

  }
  
}
