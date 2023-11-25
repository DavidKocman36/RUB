module Validations
    def self.included val
        val.extend self
    end

    # Overloading of the "validate" method
    def validate(*args)
        if args.size == 0
            # the method that calls all the validations
            self.class.class_variable_set("@@errors", [])
            aux = self.class.class_variable_get("@@valids")

            aux.each do |valid|
                next unless self.instance_variable_defined?("@#{valid[0]}")
                # Whether the validace is symbol -> call method or call a proc if the validace is proc
                if valid[1].class == Symbol
                    result = self.send(valid[1], self.instance_variable_get("@#{valid[0]}"))
                    raise "The proc does not return a boolean value!" if result.class != TrueClass && result.class != FalseClass
                    self.class.class_variable_set("@@errors", self.class.class_variable_get("@@errors") << valid[2]) unless result
                else
                    result = valid[1].call(self.instance_variable_get("@#{valid[0]}"))
                    raise "The proc does not return a boolean value!" if result.class != TrueClass && result.class != FalseClass
                    self.class.class_variable_set("@@errors", self.class.class_variable_get("@@errors") << valid[2]) unless result
                end
            end

            if self.class.class_variable_get("@@errors").empty?
                return true
            end
            return false
            
        elsif args.size == 2 || args.size == 3
            # the method for creating validations
            name, validace, message = args
            message ||= "ERROR!"

            raise "The first argument should be a symbol!" unless name.class == Symbol
            raise "The second argument should be a proc/lambda/block!" unless validace.class == Symbol || validace.respond_to?(:call) == true

            self.class_variable_set("@@valids", []) unless self.class_variable_defined?("@@valids")
            self.class_variable_set("@@errors", []) unless self.class_variable_defined?("@@errors")
            
            # create an array containing the holy trinities -> name of the variable, method and error message
            aux = Array.new << [name, validace, message]
            if self.class_variable_get("@@valids").empty? == false
                aux  = self.class_variable_get("@@valids") << aux[0]
            end
            self.class_variable_set("@@valids", aux) 
        else
            raise "Not enough parameters!"
        end        
    end

    self.define_method "errors" do
        # get the error array
        self.class.class_variable_get("@@errors")
    end

    self.define_method "valid?" do
        return self.validate
    end
    
    self.define_method "validate!" do
        result = self.validate
        raise "#{self.errors}" unless result
        return true
    end
end