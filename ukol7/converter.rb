require 'net/http'

class Converter
    def self.convert(amount, currency1, currency2)
        @@amount = amount.to_i
        @@currency1 = currency1.upcase
        @@currency2 = currency2.upcase

        self.check_inputs()
        self.get_data()

        curr1 = Array.new
        curr2 = Array.new

        @@currency1 = "|"+@@currency1+"|"
        @@currency2 = "|"+@@currency2+"|"
        curr1_regex = Regexp.new(Regexp.escape(@@currency1))
        curr2_regex = Regexp.new(Regexp.escape(@@currency2))

        @@data.each do |d|
            if d =~ curr1_regex
                aux_curr1 = d.split("|")
                curr1 << aux_curr1[2].to_i << aux_curr1[4].gsub(',', '.').to_f
            end
            if d =~ curr2_regex
                aux_curr2 = d.split("|")
                curr2 << aux_curr2[2].to_i << aux_curr2[4].gsub(',', '.').to_f
            end
        end

        
        
        raise "Unknown currency! Use ./main.rb list_rates for all available currencies!" if curr1.empty? || curr2.empty?
        curr1[1] = curr1[1]/curr1[0] if curr1[0] != 1
        curr2[1] = curr2[1]/curr2[0] if curr2[0] != 1
        
        puts "Converting..."
        result = 0.0
        if @@currency1 == "|CZK|"
            result = @@amount / curr2[1] 
        elsif @@currency2 == "|CZK|"
            result = @@amount * curr1[1] 
        else
            result = @@amount * curr1[1] / curr2[1] 
        end

        puts "#{@@amount} #{@@currency1[1..-2]} = #{result.round(3)} #{@@currency2[1..-2]} as of #{@@data[0].split(" ")[0]}."
    end

    def self.list_rates()
        self.get_data()
        
        puts
        puts "The current rates as of #{@@data[0].split(" ")[0]} are:"
        @@data[2..-1].each do |d|
            result = d.split("|")
            puts "\t#{result[0]}#{" " * (22 - result[0].force_encoding("UTF-8").length)}#{result[4]} CZK = #{result[2]} #{result[3]}"
            #puts sprintf '%20s  %10s', result[0], result[4]
        end
    end

    private
    @@LINK = URI("https://www.cnb.cz/cs/financni-trhy/devizovy-trh/kurzy-devizoveho-trhu/kurzy-devizoveho-trhu/denni_kurz.txt")
    @@amount
    @@currency1
    @@currency2
    @@data
    
    def self.check_inputs()
        raise "Incorrect amount!" if @@amount < 1
        raise "Wrong currency format!" if @@currency1.class != String || @@currency2.class != String || @@currency1.length != 3 || @@currency2.length != 3
    end

    def self.get_data()
        puts 'Retrieving data...'
        @@data = Array.new
        aux = Net::HTTP.get(@@LINK)
        @@data = aux.split("\n")
        @@data << "Česká Republika|koruna|1|CZK|1|\n"
    end
end