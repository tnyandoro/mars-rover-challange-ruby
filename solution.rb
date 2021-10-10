require_relative 'mars_rover'
require_relative 'mars_grid'

class Solution
    attr_accessor :grid, :mars_rover
  
    # Check if the input is valid
    def input_grid_valid?(mars_top_right_x, mars_top_right_y)
        if mars_top_right_x.to_i < 0 || mars_top_right_y.to_i < 0
            puts "Invalid input. Please enter positive integers."
            return false
        end
        return true
    end

    # Let the user input the grid coordinates
    def input_grid_coordinates 
        puts "Please enter the grid coordinates (x,y):"
        mars_top_right_x, mars_top_right_y = gets.chomp.split(',')
        if input_grid_valid?(mars_top_right_x, mars_top_right_y)
            @grid = MarsGrid.new(mars_top_right_x.to_i, mars_top_right_y.to_i)
        else
            input_grid_coordinates
        end
    end

    def process_Mars_rovers
        # Processes 2 lines at a time
        STDIN.each_slice(2).each_with_index do |lines, index|
          rover_x, rover_y, rover_face = lines[0].split
    
          # Checks if the rover coordinates are valid according to grid config
          unless @grid.valid?(rover_x.to_i, rover_y.to_i, rover_face.to_s)
            puts 'Invalid mars_rover co-ordinates/heading: ' \
                 "(#{rover_x}, #{rover_y}, #{rover_face})"
            next
        end

     # Create a new Mars_rover
        @mars_rover = MarsRover.new(rover_x.to_i, rover_y.to_i, rover_face.to_s)

        # Puts the Instructions/commands
        catch :invalid_instruction do
            # Executes each instruction sequentially
            lines[1].chomp.each_char do |instruction|
              throw :invalid_instruction unless process_instruction(instruction)
            end
        end

        # Prints the final position of the rover
          # If rover instruction is invalid
      next unless @rover.id != -1
      @rover.print_current_location
    end
  end

  # Executes the commands given by the user 
    def process_instruction(instruction)
        case instruction
        when 'L'
            @mars_rover.turn_left
        when 'R'
            @mars_rover.turn_right
        when 'M'
            @mars_rover.move
        else
            puts "Invalid instruction: #{instruction}". \
            'Allowed commands: L, M, R'
            @mars_rover.id = -1
            return false
        end
    end
end

# Main execution of the Rover program
if _FILE_== $PROGRAM_NAME
solution = Solution.new
solution.input_grid_coordinates
solution.process_Mars_rovers
end 








