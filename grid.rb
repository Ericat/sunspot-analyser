class Grid

  attr_reader :cells, :grid_size, :number_of_results

  def initialize(input)
    data = input.split(' ').map { |x| x.to_i }
    @number_of_results = data[0]
    @grid_size = data[1]
    @cells = data.drop(2).each_slice(@grid_size).to_a
  end

  def value_at(x, y)
    valid_range?(x, y) ? @cells[y][x] : 0
  end

  def score(x, y)
   score = 0
   @neighbours = [ value_at(x-1, y-1),  value_at(x, y-1), value_at(x+1, y-1),
                   value_at(x-1, y),    value_at(x, y),   value_at(x+1, y),
                   value_at(x-1, y+1),  value_at(x, y+1), value_at(x+1, y+1)
                  ]
    score += @neighbours.reduce(:+)
  end
  
  def scores(number_of_results)
  end

  private

  def valid_range?(x, y)
    max_size = @grid_size-1
    x.between?(0, max_size) && y.between?(0, max_size)
  end

end





