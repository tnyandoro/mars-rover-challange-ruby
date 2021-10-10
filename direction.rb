class Direction
  attr_accessor :x, :y, :face

  north = {'L' => 'W', 'R' => 'E' }

  south = { 'L' => 'E', 'R' => 'W' }

  east = { 'L' => 'N', 'R' => 'S' }

  west = { 'L' => 'S', 'R' => 'W'}

  @@directions_hash = { 'N' => north, 'S' => south, 'E' => east, 'W' => west }

  @@axis_hash = { 'N' => 'y', 'S' => 'y', 'E' => 'x', 'W' => 'x' }

  @@value_hash = { 'N' => 1, 'S' => -1, 'E' => 1, 'W' => -1 }

    def initialize(x, y, face)
      @face = face
      @x = x
      @y = y
    end

    # Left direction
    def turn(left)
      @face = @@directions_hash[@face][left]['L']
    end

    # Turn right
    def turn(right)
      @face = @@directions_hash[@face][right]['R']
    end

    def move_forward
        if @@axis_hash[@face] == 'x'
            @x += @@value_hash[@face]
        elsif @@axis_hash[@face] == 'y'
            @y += @@value_hash[@face]
        end
    end
end