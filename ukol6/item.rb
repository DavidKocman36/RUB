class Item
    include Attributes
    include Validations
  
    attribute :name, type: String, allow_nil: false
    attribute :size, type: Integer
    attribute :metadata
    attribute :something, allow_nil: false
  
    validate :name, :check_allowed, 'Nope!'
    validate :name, ->(value) { value.length > 2 }, "Short!"
    validate :size, ->(value) { value.positive? }
  
    def check_allowed(value)
      value != 'Sword'
    end
end