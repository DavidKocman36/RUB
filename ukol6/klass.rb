class Klass
    include Validations
    
    attr_accessor :name, :size

    validate :name, :check_allowed, 'Nope!'
    validate :name, ->(value) { value.length > 2 }, "Short!"
    validate :size, ->(value) { value.positive? }

    def check_allowed(value)
        value != 'Sword'
    end

end