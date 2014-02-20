require './analyser'

describe Analyser do

    let(:analyser) { Analyser.new }
    let(:grid) { analyser.parse('1 3 4 2 3 2 2 1 3 2 1') }

  it 'should be able to parse the command 1 3 4 2 3 2 2 1 3 2 1' do
    expect(grid).to be_an_instance_of(Grid)
    expect(grid.n_results).to eq(1)
    expect(grid.grid_size).to eq(3)
    expect(grid.cells).to eq([4, 2, 3, 2, 2, 1, 3, 2 ,1])
  end


 
end