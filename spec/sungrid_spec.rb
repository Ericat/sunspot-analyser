require './sungrid'

describe SunGrid do
    let(:grid) { SunGrid.new('1 3 4 2 3 2 2 1 3 2 1')}
    
  context 'Initialise' do
    it 'should be initialised with a number of results, a size and an array of integers' do
      expect(grid.number_of_results).to eq(1)
      expect(grid.grid_size).to eq(3)
      expect(grid.rows).to be_an_instance_of(Array)
      expect(grid.rows).to eq([[4, 2, 3], [2, 2, 1], [3, 2, 1]])
    end
  end
  
  it 'should find the value from a set of coordinates' do
    expect(grid.value_at(1, 1)).to eq(2)
    expect(grid.value_at(0, 0)).to eq(4)
    expect(grid.value_at(2, 2)).to eq(1)
    expect(grid.value_at(1, 2)).to eq(2)
    expect(grid.value_at(2, 1)).to eq(1)
  end

  it 'should return 0 for all coordinates located outside the grid' do
    expect(grid.value_at(-1, -1)).to eq(0)
    expect(grid.value_at(3, 3)).to eq(0)
  end

  it 'should return the right score for each value' do
    expect(grid.score(1, 1)).to eq(20)
    expect(grid.score(0, 0)).to eq(10)
    expect(grid.score(0, 1)).to eq(15)
    expect(grid.score(2, 1)).to eq(11)
  end

  it 'should return an array with each coordinate => score pairs' do
    scores = [{'1,1'=>20}, {'0,1'=>15}, {'1,0'=>14}, {'2,1'=>11}, {'1,2'=>11}, {'0,0'=>10}, {'0,2'=>9}, {'2,0'=>8}, {'2,2'=>6}]
    expect(grid.scores).to eq(scores)
  end

  it 'should take n amount of scores and print them out' do
    scores = grid.scores
    expect(grid.output(scores)).to eq('(1,1 score:20)')
  end


end