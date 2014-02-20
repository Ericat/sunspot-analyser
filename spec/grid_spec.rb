require './grid'

describe Grid do
    let(:grid) { Grid.new('1 3 4 2 3 2 2 1 3 2 1')}
    
  context 'Initialise' do
    it 'should be initialised with a n of results, a size and an array of numbers' do
      expect(grid.number_of_results).to eq(1)
      expect(grid.grid_size).to eq(3)
      expect(grid.cells).to be_an_instance_of(Array)
      expect(grid.cells).to eq([[4, 2, 3], [2, 2, 1], [3, 2, 1]])
    end
  end
  
  it 'should find the value from a set of coordinates' do
    expect(grid.coordinates(1, 1)).to eq(2)
    expect(grid.coordinates(0, 0)).to eq(4)
    expect(grid.coordinates(2, 2)).to eq(1)
    expect(grid.coordinates(1, 2)).to eq(2)
    expect(grid.coordinates(2, 1)).to eq(1)
  end

  it 'should return 0 for coordinates located outside the grid' do
    expect(grid.coordinates(-1, -1)).to eq(0)
    expect(grid.coordinates(3, 3)).to eq(0)
  end

  it 'value at coordinates 1,1 should return a score of 20' do
    expect(grid.score(1, 1)).to eq(20)
    expect(grid.score(0, 0)).to eq(10)
  end


end