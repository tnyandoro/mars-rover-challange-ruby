# spec/solution_spec.rb 

require 'spec_helper'

describe 'Solution' do
    before :all do
        @solution = Solution.new
    end

    describe '#new' do
        it 'should return a new Solution object' do
           expect(@solution).to be_a Solution
        end

        it 'should not return nil' do
            expect(@solution).not_to be_nil
        end
    end

    describe '#input_grid_valid' do
        it 'should return true for valid input grid coordinates' do
            expect(@solution.input_grid_valid?(5, 5)).to be_truthy
        end

        it 'should return false for invalid input grid coordinates' do
            expect(@solution.input_grid_valid?('a', 5)).to be_falsey
            expect(@solution.input_grid_valid?(5, 'a')).to be_falsey
        end
    end

    describe 'take_grid_coordinates' do
        it 'should take input grid and create MarsGrid object' do
            allow(@solution).to receive(:gets).and_return('5 5')
            @solution.take_grid_coordinates
            expect(@solution.mars_grid.top_right_x).to eq(5)
            expect(@solution.mars_grid.top_right_y).to eq(5)
        end

        it 'throw an ArgumentError on invalid grid input' do
            allow(@solution).to receive(:gets).and_return('a 5')
            expect { @solution.take_grid_coordinates }.to raise_error(ArgumentError)
        end
    end

    describe '#process_commands' do
        it 'should process the commands' do
            allow(@solution).to receive(:gets).and_return('5 5', '1 2 N', 'LMLMLMLMM', '3 3 E', 'MMRMMRMRRM')
            @solution.take_grid_coordinates
            @solution.take_rover_commands
            expect(@solution.rover_list.length).to eq(2)
            expect(@solution.rover_list[0].x).to eq(1)
            expect(@solution.rover_list[0].y).to eq(3)
            expect(@solution.rover_list[0].direction).to eq('N')
            expect(@solution.rover_list[1].x).to eq(5)
            expect(@solution.rover_list[1].y).to eq(1)
            expect(@solution.rover_list[1].direction).to eq('E')
        end

        it 'should return false on invalid commands' do
            allow(STDOUT).to receive(:puts)
            @solution.mars_rover = Rover.new(1, 2, 'N')
            expect(@solution.process_commands('A')).to be_falsey
        end
    end
end

