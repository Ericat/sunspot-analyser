require './grid'

describe Grid do
    let(:grid) { Grid.new('1 3 4 2 3 2 2 1 3 2 1')}
    
  context 'Initialise' do
    it 'should be initialised with a n of results, a size and an array of numbers' do
      expect(grid.number_of_results).to eq(1)
      expect(grid.grid_size).to eq(3)
      expect(grid.rows).to be_an_instance_of(Array)
      expect(grid.rows).to eq([[4, 2, 3], [2, 2, 1], [3, 2, 1]])
    end
  end
  
  it 'should find the value from a set of value_at' do
    expect(grid.value_at(1, 1)).to eq(2)
    expect(grid.value_at(0, 0)).to eq(4)
    expect(grid.value_at(2, 2)).to eq(1)
    expect(grid.value_at(1, 2)).to eq(2)
    expect(grid.value_at(2, 1)).to eq(1)
  end

  it 'should return 0 for value_at located outside the grid' do
    expect(grid.value_at(-1, -1)).to eq(0)
    expect(grid.value_at(3, 3)).to eq(0)
  end

  it 'should return the right score for each value' do
    expect(grid.score(1, 1)).to eq(20)
    expect(grid.score(0, 0)).to eq(10)
    expect(grid.score(0, 1)).to eq(15)
    expect(grid.score(2, 1)).to eq(11)
  end

  it 'should return an array with each score' do
    expect(grid.scores).to eq([10, 14, 8, 15, 20, 11, 9, 11, 6])
  end


end