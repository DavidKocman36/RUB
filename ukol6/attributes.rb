module Attributes
    # For inclusion instead of extension
    def self.included atr
        atr.extend self
    end

    def attribute(name, type: nil, allow_nil: true)
        # create the attribute
        raise "The name should be symbol!" unless name.class == Symbol
        raise "Allow_nil should be a boolean!" if allow_nil.class != TrueClass && allow_nil.class != FalseClass

        # array for keeping track of non nil attributes for the "missing param" check in the init method
        self.class_variable_set("@@notnil_m", []) unless self.class_variable_defined?("@@notnil_m")
        if allow_nil==false
            aux = Array.new << name
            if self.class_variable_get("@@notnil_m").empty? == false
                aux  = self.class_variable_get("@@notnil_m") << aux[0]
            end
            self.class_variable_set("@@notnil_m", aux) 
        end 

        # Define getter
        self.define_method "#{name}" do
            self.instance_variable_get("@#{name}")
        end

        # Define setter
        self.define_method "#{name}=" do |value|
            if(allow_nil == false && value.nil?)
                raise "Value should not be nil!"
            end

            if type.nil? == false && (value.class.to_s != type.to_s && value.class != NilClass)
                raise "Invalid type!"    
            end  
            
            self.instance_variable_set("@#{name}", value)
        end
    end

    def initialize(opts = {})        
        aux = self.class.class_variable_get("@@notnil_m")
        # check the missing params -> subtract the option keys from class variable with non nil attributes
        raise "Missing parameter(s): #{aux - opts.keys}!" if aux.empty? == false && (aux - opts.keys).empty? == false
        opts.each do |k, v|
            k = k.to_s+"="
            self.send(k, v)
        end
    end
end