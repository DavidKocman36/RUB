# frozen_string_literal: true

require_relative './grid'
# Parse string for 9x9 sudoku game
class StringParser
  # Static methods will follow
  class << self
    # Return true if passed object is supported by this loader
    def supports?(arg)
        return false if arg.class != String

        /\A(\d+|\.)+\z/.match?(arg)
    end

    # Return Grid object when finished parsing
    def load(arg)
        grid = Grid.new(9)
        arg = arg.gsub(".", "0")
        numbers = arg.split('')

        idx = -1
        grid.the_grid = Matrix.build(grid.dimension, grid.dimension) do |row, column|
            numbers[idx+=1].to_i
        end

        return grid
    end
  end
end
