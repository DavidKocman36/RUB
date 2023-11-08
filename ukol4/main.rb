#!/usr/bin/env/ruby
require_relative "romanConvertible.rb"

first = Roman.new("IV")
puts 1 + first
puts first * 2
puts 16 / first
puts first - 2


puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

second = Roman.new(6)
puts first + second
puts second - first
puts first - second
puts first/second
puts "---------------------------------------------------------------"

puts [Roman.new(1), Roman.new(3), Roman.new(9)].sum

puts (1..100).first(first)

puts Roman.new(4) == 4 # => true
puts Roman.new(5) > Roman.new(1) # => true
puts 4 < Roman.new(4)

puts [Roman.new(9), Roman.new(1), Roman.new(4)].min

puts "================="

puts second.to_i
puts second.to_int
puts second.to_s

puts
puts (Roman.new(1)..Roman.new(5)).to_a
#puts
#puts (1..Roman.new(5)).to_a
#puts
#puts (Roman.new(1)..5).to_a

class Four
    include RomanConvertible

    def to_s
        'IV'
    end

    def to_i
        4
    end
end
  
  
p Four.new.parse_roman # => 4
p Four.new.to_roman # => Roman
p Four.new.to_roman_string # => "IV"

puts "===================================="
Integer.include RomanConvertible
p 6.to_roman_string # => "VI"


puts "======s"
p 6.to_roman # => Roman


String.include RomanConvertible
p 'IV'.parse_roman # => 4
p "IV".to_roman
p Roman.new("V")
p Roman.new(4)
#'IV'.to_roman # => Roman