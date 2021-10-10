# spec/mars_grid_spec.rb

require 'spec_helper'

describe MarsGrid do
    let(:grid) { MarsGrid.new(5, 5) }
    
    describe '#initialize' do
        it 'should create a new grid' do
        expect(grid).to be_a(MarsGrid)
        end
    end
    
    describe '#grid' do
        it 'should return the grid' do
        expect(grid.grid).to be_a(Array)
        end
    end
    
    describe '#grid_size' do
        it 'should return the size of the grid' do
        expect(grid.grid_size).to be_a(Array)
        end
    end
    
    describe '#grid_size_x' do
        it 'should return the size of the grid in the x direction' do
        expect(grid.grid_size_x).to be_a(Fixnum)
        end
    end
    
    describe '#grid_size_y' do
        it 'should return the size of the grid in the y direction' do
        expect(grid.grid_size_y).to be_a(Fixnum)
        end
    end
    
    describe '#grid_size_x_y' do
        it 'should return the size of the grid in the x and y direction' do
        expect(grid.grid_size_x_y).to be_a(Array)
        end
    end
    
    describe '#grid_size_x_y_hash' do
        it 'should return the size of the grid in the x and y direction as a hash' do
        expect(grid.grid_size_x_y_hash).to be_a(Hash)
        end
    end
    
    describe '#grid_size_x_y_hash_x' do
        it 'should return the size of the grid in the x direction as a hash' do
        expect(grid.grid_size_x_y_hash_x).to be_a(Hash)
        end
    end
    
    describe '#grid_size_x_y_hash_y' do
        it 'should return the size of the grid in the y direction as a hash' do
        expect(grid.grid_size_x_y_hash_y).to be_a(Hash)
        end
    end
 end