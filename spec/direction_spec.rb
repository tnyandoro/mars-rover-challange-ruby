require_relative 'spec_helper'

 describe Direction do
  before :each do
    @direction = Direction.new(1, 1, 'N')
  end

  describe '#new' do
    it 'should return a Direction object' do
      expect(@direction).to be_an_instance_of Direction
    end
  end

  it 'should not return nil' do
    expect(@direction).not_to be_nil
  end
end

describe '#turn_left' do
    it 'should return a new direction faced' do
        rest_faces = %w(W S E N) - [@direction.face]
        @direction.turn_left
        expect(rest_faces).to include @direction.face
    end

    it 'should rotate current faced direction towards left' do
        @direction.turn_left
        expect(@direction.face).to eq ('W')
    end
end

describe '#turn_right' do
    it 'should return a new direction faced' do
        rest_faces = %w(N S E W) - [@direction.face]
        @direction.turn_right
        expect(rest_faces).to include @direction.face
    end

    it 'should rotate current faced direction towards right' do
        @direction.turn_right
        expect(@direction.face).to eq ('E')
    end
end

describe '#move' do
    it 'should move a step in the current faced direction' do
        prev_y_value = @direction.y_value
        @direction.move
        expect(@direction.y_value - prev_y_value).to eq (1)
    end

    it 'should move only along 1 axis' do
        prev_x_value = @direction.x_value
        @direction.move
        expect(@direction.x_value - prev_x_value).to eq (0)
    end
    end
end

