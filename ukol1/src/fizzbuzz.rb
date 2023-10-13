#!/usr/bin/env/ruby

left_num = nil
left_num == nil ? left_num = 1 : left_num = left_num
right_num = nil
right_num == nil ? right_num = 100 : right_num = right_num

is_divisible = false

divisibles = [
    [3, "Fizz "], 
    [5, "Buzz "],
    [7, "Bish "],
    [4, "Bash "],
    [6, "Bosh "]
]

divisibles.length < 2 ? divisibles = [[3, "Fizz "], [5, "Buzz "]] : divisibles = divisibles

left_num.upto(right_num) do |i|

    divisibles.each do |(num, text)|
        if i % num == 0
            print text
            is_divisible = true
        end
    end

    print i unless is_divisible
    print "," unless i == right_num
    is_divisible = false
end
