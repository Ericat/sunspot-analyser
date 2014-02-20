require './grid'

describe Grid do
    let(:grid) { Grid.new(1, 3, [4, 2, 3, 2, 2, 1, 3, 2, 1])}
    
  context 'Initialise' do
    it 'should be initialised with a n of results, a size and an array of numbers' do
      expect(grid.cells).to be_an_instance_of(Array)
      expect(grid.grid_size).to eq(3)
      expect(grid.n_results).to eq(1)
    end
  end
  
  context 'Finding coordinates of an index' do
    it 'should return coordinates [1][1] at index 4' do
      # expect(grid.coords(4)).to eq("1, 1")
      expect(grid.coords(4)).to eq(grid.cells[1][1])
    end
  end

  it 'value at index 4 should return a score of 20' do
    scores = grid.calculate_scores
    expect(grid.get_scores(1)).to eq('(1,1 score:20)')
  end

end