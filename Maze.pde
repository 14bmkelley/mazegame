/**
 * Maze.java
 * A class to represent a maze with logic to support the use
 *   of Treasures, Monsters, and an Explorer.
 * @author Brandon M. Kelley
 * @since October 23, 2015
 */

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintStream;
import java.util.ArrayList;

public class Maze {
  
  public static final int ACTIVE = 0;
  public static final int EXPLORER_WIN = 1;
  public static final int MONSTER_WIN = 2;
  
  private Square[][] squares;
  private int rows, cols;
  private ArrayList<RandomOccupant> randomOccupants;
  private Explorer explorer;
  
  /**
   * Default contructor for the Maze
   */
  public Maze() {
    randomOccupants = new ArrayList<RandomOccupant>();
  }
  
  /**
   * Constructor that initializes all instance variables
   * @param squares: the Maze as an array of Squares
   * @param rows: number of rows in the Maze
   * @param cols: number of columns in the Maze
   */
  public Maze(Square[][] squares, int rows, int cols) {
    this.squares = squares;
    this.rows = rows;
    this.cols = cols;
    randomOccupants = new ArrayList<RandomOccupant>();
    explorer = null;
  }

  /**
   * Square accessor
   * @param row: row of the requested square
   * @param col: column of the requested square
   * @return Square: the requested square
   */
  public Square getSquare(int row, int col) {
    return squares[row][col];
  }

  /**
   * Rows accessor
   * @return int: number of rows in the Maze
   */
  public int rows() {
    return rows;
  }

  /**
   * Columns accessor
   * @return int: number of columns in the Maze
   */
  public int cols() {
    return cols;
  }
  
  /**
   * Explorer name accessor
   * @return String: name of the Explorer in this maze
   */
  public String explorerName() {
    return explorer.name();
  }

  /**
   * Explorer accessor
   * @return Explorer: the Explorer in the maze
   */
  public Explorer getExplorer() {
    return explorer;
  }

  /**
   * RandomOccupant accessor
   * @param index: index of the RandomOccupant requested
   * @return RandomOccupant: the requested RandomOccupant
   */
  public RandomOccupant getRandomOccupant(int index) {
    return randomOccupants.get(index);
  }

  /**
   * Get the size of the RandomOccupants list
   * @return int: number of RandomOccupants
   */
  public int getNumRandOccupants() {
    return randomOccupants.size();
  }

  /**
   * Add a RandomOccupant
   * @param ro: RandomOccupant to be added
   */
  public void addRandomOccupant(RandomOccupant ro) {
    randomOccupants.add(ro);
  }

  /**
   * Explorer mutator
   * @param e: explorer to be set
   */
  public void setExplorer(Explorer e) {
    explorer = e;
  }

  /**
   * Move the explorer
   * @param key: key code of the direction to move the Explorer
   */
  public void explorerMove(int key) {
    explorer.move(key);
  }

  /**
   * Move each RandomOccupant
   */
  public void randMove() {
    for (int i = 0; i < randomOccupants.size(); i++) {
      randomOccupants.get(i).move();
    }
  }

  /**
   * Get the status of the game
   * @return int: status of the game
   */
  public int gameStatus() {
    
    // If the explorer has won
    if (foundAllTreasures()) {
      return EXPLORER_WIN;
    }

    // If a Monster is in the same space as the explorer
    for (int i = 0; i < randomOccupants.size(); i++) {
      if (randomOccupants.get(i) instanceof Monster) {
        
        Square monsterLocation = randomOccupants.get(i).location();
        Square explorerLocation = explorer.location();
        
        if (monsterLocation.row() == explorerLocation.row() &&
            monsterLocation.col() == explorerLocation.col()) {
          return MONSTER_WIN;
        }

      }
    }

    return ACTIVE;

  }
  
  /**
   * Check the surroundings for whether to display them
   * @param square: the Square to check surroundings of
   */
  public void lookAround(Square square) {
    
    // Get current location
    int row = square.row();
    int col = square.col();
    
    // Set all Squares out of view
    resetInView();

    // Make the current location visible
    square.setInView(true);
    
    // Check for walls in all directions
    if (!square.wall(Square.UP)) {
      
      // Add this Square to view
      if (row > 0) {
        
        row--;
        Square up = getSquare(row, col);
        up.setInView(true);
        
        // Check diagonal neighbor up and right
        if (!up.wall(Square.RIGHT)) {
          if (row < rows - 1) {
            Square upright = getSquare(row, col + 1);
            upright.setInView(true);
          }
        }
  
        // Check diagonal neighbor up and left
        if (!up.wall(Square.LEFT)) {
          if (cols > 0) {
            Square upleft = getSquare(row, col - 1);
            upleft.setInView(true);
          }
        }

        row++;
        
      }

    }

    if (!square.wall(Square.RIGHT)) {
      
      // Add this Square to view
      if (col < cols - 1) {
        
        col++;
        Square right = getSquare(row, col);
        right.setInView(true);
        
        // Check diagonal neighbor right and up
        if (!right.wall(Square.UP)) {
          if (row > 0) {
            Square rightup = getSquare(row - 1, col);
            rightup.setInView(true);
          }
        }
  
        // Check diagonal neighbor right and down
        if (!right.wall(Square.DOWN)) {
          if (row < rows - 1) {
            Square rightdown = getSquare(row + 1, col);
            rightdown.setInView(true);
          }
        }

        col--;
        
      }

    }

    if (!square.wall(Square.DOWN)) {

      // Add this Square to view
      if (row < rows - 1) {
        
        row++;
        Square down = getSquare(row, col);
        down.setInView(true);
        
        // Check diagonal neighbor down and right
        if (!down.wall(Square.RIGHT)) {
          if (col < cols - 1) {
            Square downright = getSquare(row, col + 1);
            downright.setInView(true);
          }
        }
        
        // Check diagonal neighbor up and left
        if (!down.wall(Square.LEFT)) {
          if (col > 0) {
            Square downleft = getSquare(row, col - 1);
            downleft.setInView(true);
          }
        }

        row--;
        
      }

    }

    if (!square.wall(Square.LEFT)) {
      
      // Add this Square to view
      if (col > 0) {
        
        col--;
        Square left = getSquare(row, col);
        left.setInView(true);
        
        // Check diagonal neighbor left and up
        if (!left.wall(Square.UP)) {
          if (row > 0) {
            Square leftup = getSquare(row - 1, col);
            leftup.setInView(true);
          }
        }
  
        // Check diagonal neighbor right and down
        if (!left.wall(Square.DOWN)) {
          if (row < rows - 1) {
            Square leftdown = getSquare(row + 1, col);
            leftdown.setInView(true);
          }
        }
        
        col++;

      }
      
    }
    
  }
  
  /**
   * Save the current Maze to a file
   * @param fileName: String to use as the name of the save file
   */
  public void writeMazeToFile(String fileName) throw IOException {
    
    // Create output file stream
    PrintStream file = new PrintStream(new File(fileName));
    
    // Write maze dimensions
    file.println(rows + "," + cols);
    
    // Write Squares
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        file.println(squares[i][j].toText());
      }
    }
    
    // Write Explorer
    file.println(explorer.toText());
    
    // Write RandomOccupants
    for (int i = 0; i < randomOccupants.size(); i++) {
      
      // Write a Treasure
      if (randomOccupants[i] instanceof Treasure) {
        file.println(((Treasure) randomOccupants[i]).toText());
        
      // Write a Monster
      } else {
        file.println(randomOccupants[i].toText());
      }
      
    }
    
    // Close the output file
    file.close();
    
  }
  
  /**
   * Read and set the Maze status from a file
   * @param fileName: String to use as the name of the saved file
   */
  public void readMazeFromFile(String fileName)
    throws IOException, FileNotFoundException, MazeReadException {
    
    // Create input file stream
    Scanner file = new Scanner(new File(fileName));
    
    // Read in the size of the Maze
    Scanner mazeSetup = new Scanner(file.nextLine()).useDelimiter(",");
    rows = mazeSetup.nextInt();
    cols = mazeSetup.nextInt();
    squares = new Square[rows][cols];
    
    // Loop through lines of the saved file
    while (file.hasNextLine()) {
      
      // Identify what kind of maze object is on the next line
      Scanner input = new Scanner(file.nextLine()).useDelimiter(",");
      String datatype = input.next();
      
      // Create a new Square
      if (datatype.equals("Square")) {
        int row = input.nextInt();
        int col = input.nextInt();
        squares[row][col] = new Square(row, col);
        squares[row][col].toObject(input);
      
      // Create a new Explorer
      } else if (datatype.equals("Explorer")) {
        explorer = new Explorer(maze);
        explorer.toObject(input);
      
      // Create a new Monster
      } else if (datatype.equals("Monster")) {
        Monster m = new Monster(maze);
        m.toObject(input);
        randomOccupants.add(m);
      
      // Create a new Treasure
      } else if (datatype.equals("Treasure")) {
        Treasure t = new Treasure(maze);
        t.toObject(input);
        randomOccupants.add(t);
      }
      
    }
    
  }
  
  /**
   * Check if all of the treasures have been found
   * @return boolean: whether all of the treasures have been found
   */
  private boolean foundAllTreasures() {
    
    for (int i = 0; i < randomOccupants.size(); i++) {
      if (randomOccupants.get(i) instanceof Treasure) {
        if (!((Treasure) randomOccupants.get(i)).found()) {
          return false;
        }
      }
    }

    return true;
    
  }

  /**
   * Set all Squares to be invisible
   */
  private void resetInView() {
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        squares[i][j].setInView(false);
      }
    }
  }
  
}
