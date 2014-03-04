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
   neighbours = [ value_at(x-1, y-1),  value_at(x, y-1), value_at(x+1, y-1),
                   value_at(x-1, y),    value_at(x, y),   value_at(x+1, y),
                   value_at(x-1, y+1),  value_at(x, y+1), value_at(x+1, y+1)
                  ]
    neighbours.reduce(0, :+)
  end
  
  def scores
    @scores =  []
    @rows.flatten.each_with_index do |cell, index|
      @scores << {"#{x(index)},#{y(index)}" => score(x(index), y(index))}
    end
    @scores
  end

  def output
    sorted_scores = @scores.sort_by {|score| score.values}.reverse!
    results = sorted_scores.take(@number_of_results).inject([]) do |memo, score|
                memo << "(#{score.keys} score:#{score.values})".gsub(Regexp.union(/\[/, /\]/, /\"/), '')
                memo
              end
    results.join(' ')
  end

  def scores_to_colours
    rows = @rows.flatten
    points = scores.map(&:values).flatten
    data = rows.zip(points)

    heat_map =  data.map do |value|
                { :value => value.first,
                  :score => value.last,
                  :color => (value.last * 5)
                }   
                end
    heat_map.each_slice(3).to_a
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





