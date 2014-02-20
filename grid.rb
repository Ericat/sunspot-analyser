class Grid

  attr_reader :cells, :grid_size, :number_of_results

  def initialize(input)
    data = input.split(' ').map! { |x| x.to_i }
    @number_of_results = data[0]
    @grid_size = data[1]
    @cells = data.pop(@grid_size * @grid_size).each_slice(@grid_size).to_a
  end

  def coordinates(x, y)
    @cells[row(x)][column(y)]
  end

  
  def calculate_scores

  end

  private

  def row(index)
    (index - column(index)) / @grid_size
  end

  def column(index)
    index % @grid_size
  end
end




