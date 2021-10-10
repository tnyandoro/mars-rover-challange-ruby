class MarsGrid::Grid
  attr_accessor :grid, :x_max, :y_max

  def initialize(x_max, y_max)
    @x_max = x_max
    @y_max = y_max
    @grid = Array.new(y_max) { Array.new(x_max) }
  end

  def add_rover(rover)
    @grid[rover.y][rover.x] = rover
  end

  def remove_rover(rover)
    @grid[rover.y][rover.x] = nil
  end

  def rover_at?(x, y)
    @grid[y][x] != nil
  end

  def rover_at(x, y)
    @grid[y][x]
  end

  def print_grid
    @grid.each do |row|
      row.each do |rover|
        print rover.nil? ? '.' : rover.direction
      end
      puts
    end
  end
end