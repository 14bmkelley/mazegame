/**
 * DrawableSquare.java
 * A class to represent a Square in the Maze that is drawable.
 * @author Brandon M. Kelley
 * @since October 23, 2015
 */

import java.awt.Color;

public class DrawableSquare extends Square implements Drawable {
  
  /**
   * A constructor to initialize the super class variables
   * @param up: whether there is a wall at the top
   * @param right: whether there is a wall at the right
   * @param down: whether there is a wall at the bottom
   * @param left: whether there is a wall at the left
   * @param row: the row this Square is located in
   * @param col: the column this Square is located in
   */
  public DrawableSquare(boolean up, boolean right, boolean down, boolean left, int row, int col) {
    super(up, right, down, left, row, col);
  }

  /**
   * Draw this DrawableSquare
   */
  public void draw() {
    
    if (!super.seen()) {
      return;
    }
    
    if (super.inView()) {
      
      drawTile(255, 255, 255);
      
    } else {
      
      drawTile(200, 200, 200);
      
    }
    
  }
  
  /**
   * Draw a Square of a certain color
   * @param r: red color to fill
   * @param g: green color to fill
   * @param b: blue color to fill
   */
  private void drawTile(int r, int g, int b) {
    
    fill(r, g, b);
    rect(super.x(), super.y(), super.SQUARE_SIZE, super.SQUARE_SIZE);
    
    fill(0);
    
    if (super.wall(Square.UP)) {
      rect(super.x(), super.y(), super.SQUARE_SIZE, super.WALL_SIZE);
    }
    
    if (super.wall(Square.RIGHT)) {
      rect(super.x() + super.SQUARE_SIZE - super.WALL_SIZE, super.y(), super.WALL_SIZE, super.SQUARE_SIZE);
    }
    
    if (super.wall(Square.DOWN)) {
      rect(super.x(), super.y() + super.SQUARE_SIZE - super.WALL_SIZE, super.SQUARE_SIZE, super.WALL_SIZE);
    }
    
    if (super.wall(Square.LEFT)) {
      rect(super.x(), super.y(), super.WALL_SIZE, super.SQUARE_SIZE);
    }
    
  }
  
}
