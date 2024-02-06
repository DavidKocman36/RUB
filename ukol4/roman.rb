class Roman
    attr_accessor :roman
    attr_reader :num
    attr_reader :rom

    alias :to_i :num
    alias :to_int :num
    alias :to_s :rom

    def succ
        Roman.new(@num + 1)
    end

    def initialize(param)
        if param.class == Integer && (param > 0 && param <= 1000)
            self.roman = convert_to_new_roman(param)
            @num = param
            @rom = @roman
        elsif param.class == String && !param.empty?
            self.roman = roman_to_int(param)
            @num = @roman
            @rom = param
        else
            raise "Must pass positive Integer lower than 1000 or String!"
        end
    end

    def coerce(other)
        [self, other]
    end

    def +(other)
        
        other + @num
    end

    def -(other)
        
        other - @num
    end

    def *(other)
        other * @num
    end

    def /(other)
        
        num2 = convert_num(other)
        raise "Division by zero!" if num2.zero?

        other / @num
    end

    

    include Comparable

    def <=>(other)
        if other.class == Integer
            num1 = convert_num(self)
            num1 <=> other 
        else
            num1 = convert_num(self)
            num2 = convert_num(other)
            num1 <=> num2
        end
    end

    private
    def convert_num(num)
        
        if num.class == Roman
            if num.roman.class == String
                aux = roman_to_int(num.roman)
            else
                aux = num.roman
            end
        else
            aux = num unless num.class == String
        end
        
    end
   
    # From: https://gist.github.com/jergagon1/73a13b7729fced86755d
    NUMERAL_HASH = {
        1 => "I",
        5 => "V",
        10 => "X",
        50 => "L",
        100 => "C",
        500 => "D",
        1000 => "M"
    }

    OLD_TO_NEW_NUMERALS = {
        "VIIII" => "IX", # 9
        "IIII" => "IV", # 4
        "LXXXX" => "XC", # 90
        "XXXX" => "XL", # 40
        "DCCCC" => "CM", # 900
        "CCCC" => "CD" # 400
    }

    def convert_to_old_roman number_to_convert
        reversed_numeral_hash = Hash[NUMERAL_HASH.to_a.reverse]
        answer = ""
        reversed_numeral_hash.each do |num, numeral|
            if number_to_convert >= num
            num_numerals, number_to_convert = number_to_convert.divmod(num)
            num_numerals.times { answer += numeral }
            end
        end
        answer
    end

    def convert_to_new_roman number_to_convert
        answer = convert_to_old_roman(number_to_convert)
        OLD_TO_NEW_NUMERALS.each do |old_numeral, new_numeral|
            if answer.include? old_numeral
            answer.gsub! old_numeral, new_numeral
            end
        end
        answer
    end


    # From: https://stackoverflow.com/a/53064593
    ROMAN_TO_INT =
    {
        i: 1,
        v: 5,
        x: 10,
        l: 50,
        c: 100,
        d: 500,
        m: 1000
    }

    def roman_to_int(roman)
    numbers = roman.downcase.chars.map { |char| ROMAN_TO_INT[char.to_sym] }.reverse
    numbers.inject([0, 1]) do |result_number, int|
        result, number = result_number
        int >= number ? [result + int, int] : [result - int, number]
    end.first
    end
end