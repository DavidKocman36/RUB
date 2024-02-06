# frozen_string_literal: true
require 'matrix'

# Contains sudoku game board
class Grid
    include Enumerable
    attr_reader :dimension
    attr_accessor :the_grid
  
    # Create Sudoku game grid of given dimension
    def initialize(dimension)
        @dimension = dimension
    end
  
    # Return value at given position
    def get_value(x, y);
        @the_grid[x, y]
    end

    # Return value at given position
    def set_value(x, y, num);
        @the_grid[x, y] = num
    end

    def find_empty_loc(location)
        @the_grid.each_with_index { |e, row, col|
            if e == 0
                #location.clear
                #location = [row, col]
                location[0] = row
                location[1] = col
                return true
            end
        }
        return false
    end

    def used_in_row(row, num)
        @the_grid.row(row) { |e|
            if e == num
                return true
            end
        }
        return false
    end

    def used_in_col(col, num)
        @the_grid.column(col) { |e|
            if e == num
                return true
            end
        }
        return false
    end

    def used_in_box(row, col, num)
        3.times{ |i|
            3.times{ |j|
                if(self.get_value(i + row, j + col) == num)
                    return true
                end
            }
        }
        return false
    end

    def safe_location(row, col, num)
        return true if !self.used_in_col(col, num) && !self.used_in_row(row, num) && !self.used_in_box(row - row % 3, col - col % 3, num)
        return false
    end
  
    # Serialize grid values to a one line string
    def solution
        ret = ""
        @the_grid.each do |elem|
            ret += elem.to_s
        end

        return ret
    end

    def missing
        counter = 0
        @the_grid.each do |elem|
            if elem == 0
                counter += 1
            end
        end

        return counter
    end
  end