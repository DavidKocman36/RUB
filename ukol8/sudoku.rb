# frozen_string_literal: true

require_relative './string_parser'

# Basic sudoku solver
class Sudoku
    PARSERS = [StringParser].freeze
    attr_reader :is_valid

    EXCLUDE = proc do |enum, val|
        enum.each do |e|
        e.exclude(val)
        end
    end

    def initialize(game)
        @grid = load(game)
        @is_valid = false
    end

    # Return true when there is no missing number
    def solved?
        !@grid.the_grid.nil? && @grid.missing.zero?
    end

    # This method solves sudoku with the use of backtracking algorithm
    # Inspired by
    # https://www.geeksforgeeks.org/sudoku-backtracking-7/
    def solve

        location = [0, 0]
        # No more spaces
        if !@grid.find_empty_loc(location)
            @is_valid = true
            return true
        end

        row = location[0]
        col = location[1]

        1.upto(9) do |num|
            if @grid.safe_location(row, col, num)
                @grid.set_value(row, col, num)

                if self.solve
                    return true
                end

                @grid.set_value(row, col, 0)
            end
        end

        @is_valid = false
        return false
    end

    def solution
        @grid.solution
    end

    def valid?
        @is_valid
    end

    protected

    def load(game)
        PARSERS.each do |p|
            return p.load(game) if p.supports?(game)
        end
        raise "input '#{game}' is not supported yet"
    end
end
