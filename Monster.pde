/**
 * Monster.java
 * A class to represent a Monster in the maze.
 * @author Brandon M. Kelley
 * @since October 22, 2015
 */
public class Monster extends RandomOccupant {
  
  /**
   * Constructor that randomly places the Monster
   * @param maze: the maze this Monster belongs to
   */
  public Monster(Maze maze) {
    super(maze);
  }

  /**
   * Constructor that randomly places the Monster using
   * a seed for the randomizer
   * @param maze: the maze this Monster belongs to
   * @param seed: the seed to be used for randomizing
   */
  public Monster(Maze maze, long seed) {
    super(maze, seed);
  }

  /**
   * Constructor that places the Monster at a start location
   * @param maze: the maze this Monster belongs to
   * @param start: the Square to start this Monster in
   */
  public Monster(Maze maze, Square start) {
    super(maze, start);
  }
  
}
