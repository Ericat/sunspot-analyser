class SunGrid

  attr_reader :rows, :grid_size, :number_of_results

  def initialize(input)
    data = input.split(' ').map { |x| x.to_i }
    @number_of_results = data[0]
    @grid_size = data[1]
    @rows = data.drop(2).each_slice(@grid_size).to_a
  end

  def value_at(x, y)
    valid_range?(x, y) ? @rows[y][x] : 0
  end

  def score(x, y)
   score = 0
   @neighbours = [ value_at(x-1, y-1),  value_at(x, y-1), value_at(x+1, y-1),
                   value_at(x-1, y),    value_at(x, y),   value_at(x+1, y),
                   value_at(x-1, y+1),  value_at(x, y+1), value_at(x+1, y+1)
                  ]
    score += @neighbours.reduce(:+)
  end
  
  def scores
    scores =  []
    @rows.flatten.each_with_index do |cell, index|
      scores << {"#{x(index)},#{y(index)}" => score(x(index), y(index))}
    end
    @scores = scores.sort_by {|hash| hash.values}.reverse!
  end

  def output(scores)
    results = []
    scores.take(@number_of_results).map do |score|
      results << "(#{score.keys} score:#{score.values})".gsub(Regexp.union(/\[/, /\]/, /\"/), '')
    end
    results.join(' ')
  end

  private

  def valid_range?(x, y)
    max_size = @grid_size-1
    x.between?(0, max_size) && y.between?(0, max_size)
  end

  def y(index)
    (index - x(index)) / @grid_size
  end

  def x(index)
    index % @grid_size
  end

end





