class Grid

  attr_reader :cells, :grid_size, :number_of_results

  def initialize(input)
    data = input.split(' ').map { |x| x.to_i }
    @number_of_results = data[0]
    @grid_size = data[1]
    @cells = data.drop(2).each_slice(@grid_size).to_a
  end

  def coordinates(x, y)
    max_size = @grid_size-1
    # 0 <= x && y <= @grid_size-1 ? @cells[y][x] : 0
    if x >= 0 && x <= max_size
      if y >= 0 && y <= max_size
        return @cells[y][x]
      end
    end
    0
  end

  def score(x, y)
   score = 0
   @neighbours = [ coordinates(x-1, y-1),  coordinates(x, y-1), coordinates(x+1, y-1),
                   coordinates(x-1, y),    coordinates(x, y),   coordinates(x+1, y),
                   coordinates(x-1, y+1),  coordinates(x, y+1), coordinates(x+1, y+1)
                  ]
    score += @neighbours.reduce(:+)
  end
  
  def scores(number_of_results)
  end


end





