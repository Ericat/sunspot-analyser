require_relative 'grid'

class Analyser

  def parse(input)
    command = input.chars.reject! {|v| v == " "}.map(&:to_i) 
    n_results = command[0]
    grid_size = command[1]
    cells = command.pop(grid_size * grid_size)
    grid = Grid.new(n_results, grid_size, cells)
  end
end