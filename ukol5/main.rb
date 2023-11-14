#!/usr/bin/env/ruby
require_relative "commander.rb"

commander = Commander.new
commander1 = Commander.new

commander.register(:hello) { puts 'Hello' }
commander.register(:hi) do
  puts 'Hi'
end
commander.register(:double) { |x| x * 2 }
commander.register :add, &->(x, y) { x + y }

sum = ->(*args) { args.sum }
commander.register :sum, &sum

puts commander.execute(:sum ,1,2,3,4,5)

commander.register(:inc) { |x| x + 1 }
puts commander.chain([:sum, :double, :inc], 1, 2, 3, 4, 5)
# => 31

commander.register(:one) { 1 }
puts commander.chain([:one, :inc, :inc, :inc])
# => 4

commander.list


commander.list

#puts commander.execute(:one, 2)
