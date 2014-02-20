class Grid

  attr_reader :cells, :grid_size, :number_of_results

  def initialize(input)
    data = input.split(' ').map { |x| x.to_i }
    @number_of_results = data[0]
    @grid_size = data[1]
    @cells = data.drop(2).each_slice(@grid_size).to_a
  end

  def coordinates(x, y)
    @cells[y][x]
  end

  def score(x, y)
    # neighbours = [ ([y-1][x-1]), ([y-1][x]), ([y-1][x+1]),
                   # ([y][x-1]),   ([y][x]),   ([y][x+1]),
                   # ([y+1][x-1]), ([y+1][x]), ([y+1][x+1])
                   # ]
  end
  
  def scores(number_of_results)
  end


end





