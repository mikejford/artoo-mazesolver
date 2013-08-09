require 'thread'

class Mazesolver
  attr_accessor :messages
  attr_reader :current_pos
  
  def initialize(maze)
    @maze = maze
    @current_pos = @maze.start_pos
    @messages = Queue.new
  end
  
  def up
    move((self.current_y - 1), self.current_x)
  end
  
  def down
    move((self.current_y + 1), self.current_x)
  end
  
  def left
    move(self.current_y, (self.current_x - 1))
  end
  
  def right
    move(self.current_y, (self.current_x + 1))
  end
  
  def move(*path)
    if @maze.path_available?(path)
      print_maze
      @current_pos = path
      if @maze.finished?(self)
        messages << SolvedMessage.new
      end
    else
      messages << BlockedMessage.new
    end

    @current_pos
  end

  def current_x
    @current_pos[1]
  end
  
  def current_y
    @current_pos[0]
  end

  def print_maze
    # TODO: using dup and clone don't seem to work for deep-copy,
    # if anyone can tell me why I would appreciate it...
    m = Maze::MAZE.dup

    current = m[current_y][current_x]  # grab current character
    m[current_y][current_x] = '.'      # replace it
    output = m.map(&:join).join("\n")  # build up output string
    m[current_y][current_x] = current  # put it back

    puts "\n#{output}\n"
  end

  class MazesolverMessage 
  end
  
  class SolvedMessage < MazesolverMessage
  end
  
  class BlockedMessage < MazesolverMessage
  end
  
end
