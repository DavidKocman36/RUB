class Commander

    private
    attr_accessor :method_arr
    attr_reader :staple_methods 

    public
    def initialize
        @method_arr = Array.new
        @staple_methods = [:register, :list, :remove, :execute, :chain, :new]
    end

    def register(name, &block)
        raise "Unsupported name!" if name.nil? || name.empty?
        raise "Forgot to pass a block!" unless block_given?
        raise "The command '#{name}' already exists!" if @method_arr.include? name 
        raise "The class already has a method called '#{name}'" if self.class.send(:method_defined?, name)

        define_singleton_method(name, &block)
        @method_arr << name
    end

    def list
        p @method_arr
    end

    def remove(name)
        raise "Cannot remove a staple method!" if @staple_methods.include? name
        raise "The command '#{name}' does not exist!" unless @method_arr.include? name 

        self.singleton_class.send(:undef_method, name)
        @method_arr -= [name]
    end

    def execute(name, *args)
        raise "The command '#{name}' does not exist!" unless @method_arr.include? name 

        method = self.method(name)
        method.call(*args)
    end 

    def chain(methods, *args)
        raise "Pass at least two methods!" if methods.length < 2
        methods.each do |m|
          rasise "The command '#{m}' does not exist!" unless @method_arr.include? m
        end

        method = self.method(methods[0])
        result = method
        methods.drop(1).each do |m|
            method = self.method(m)
            result = result >> method
        end 

        result.call(*args)

    end

end