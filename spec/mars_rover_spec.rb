# spec/mars_rover_spec.rb

describe MarsRover do
    before :each do
        @mars_rover = MarsRover.new(0, 1, 1, 'N')
    end

    describe '#new' do
        it 'should create a new MarsRover object' do
            expect(@mars_rover).to be_an_instance_of(MarsRover)
        end
    end

    it 'should not return nil' do
        expect(@mars_rover).not_to be_nil
    end

    describe '#move' do
        it 'should move the rover forward' do
            @mars_rover.move('M')
            expect(@mars_rover.x).to eq(1)
            expect(@mars_rover.y).to eq(2)
        end

        it 'should move the rover left' do
            @mars_rover.move('L')
            expect(@mars_rover.x).to eq(0)
            expect(@mars_rover.y).to eq(1)
        end

        it 'should move the rover right' do
            @mars_rover.move('R')
            expect(@mars_rover.x).to eq(1)
            expect(@mars_rover.y).to eq(1)
        end
    end