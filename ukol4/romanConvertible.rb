require_relative "roman.rb"

module RomanConvertible
    def to_roman_string
        aux = Roman.new(self.to_i)
        aux.to_s
    end
    
    def to_roman
        if self.class == Numeric
            Roman.new(self.to_i)
        elsif self.class == String
            Roman.new(self)
        else
            Roman.new(self.to_i)
        end 
    end

    def parse_roman
        aux = Roman.new(self.to_s)
        aux.to_i
    end 

end