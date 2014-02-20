class Grid

  attr_reader :cells, :grid_size, :n_results

  def initialize(n_results, grid_size, cells)
    @n_results = n_results
    @grid_size = grid_size
    @cells = cells
  end

  def coordinates(index)
    "#{row(index)}, #{column(index)}"
  end

  
  def calculate_scores
    # @cells.each_with_index do |cell, index|
    #    # i need the coords for the output
    # end
  end

  def scores(n_results)
    # @scores.sort_by {hash| hash[:score].reverse.take(n_results)
  end

  private

  def row(index)
    (index - column(index)) / @grid_size
  end

  def column(index)
    index % @grid_size
  end
end




