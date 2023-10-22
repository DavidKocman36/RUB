#!/usr/bin/env/ruby

class Calculator

    attr_accessor :name

    private 
    @res
    @initial_state
    

    public
    def initialize(initial = 0)
        @res = initial
        @initial_state = initial
    end

    def add(*nums)
        @res += nums.sum()
        return self
    end

    def sub(num)
        @res -= num
        return self
    end

    def mult(num)
        @res *= num
        return self
    end

    def div(num)
        raise ZeroDivisionError.new "Division by zero!" if num.zero?
        @res /= num
        return self
    end

    def result
        @res
    end 

    def reset
        @res = @initial_state
    end

    def name
        @name.upcase()
    end 

    class << self
        def extreme(min_or_max, numbers)
            if min_or_max == :max
                numbers.max
            elsif min_or_max == :min
                numbers.min
            else
                raise "Wrong extreme!"
            end
        end
        
        def number?(num)
            num.is_a?(Numeric)
        end
    end
end


calc = Calculator.new(10)

puts calc.result

calc.add(1,1,1,1,1, 10)
puts calc.result

calc.add
puts calc.result

calc.reset
puts calc.result
puts 

calc.sub(5)
puts calc.result

calc.mult(20)
puts calc.result

calc.div(50)
puts calc.result

#calc.div(0)
#puts calc.result

calc.reset
puts calc.result

puts "============"

calc.add(1,2.5,5.8).mult(10).sub(80).div(20)
puts calc.result

calc.name = "Guy"
puts calc.name

puts "============"

max = Calculator.extreme(:max, [3,2,6,6,2,4])
min = Calculator.extreme(:min, [4,1,5,5,0])

puts "Max: #{max}, min: #{min}"
#none = Calculator.extreme(:reee, [1,2,5,5,2])

puts Calculator.number?(20)
puts Calculator.number?(0)
puts Calculator.number?("20")
puts Calculator.number?(10.2)
puts Calculator.number?("AA")
