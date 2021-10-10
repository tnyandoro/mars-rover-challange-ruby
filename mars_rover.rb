require_relative 'direction'

class MarsRover
  attr_accessor :id, :dir

  def initialize(index, x, y, face)
    @id = index
    @x = x
    @y = y
    @dir = Direction.new(x, y, face)
  end

  # print the rovers current location
  def print_location
    puts [@dir.x, @y, @dir.face].join(' ')
  end

  # move the rover in the direction it is facing
  def move
    @dir.move
  end

  # turn the rover left
  def turn_left
    @dir.turn_left
  end

  # turn the rover right
  def turn_right
    @dir.turn_right
  end
end
