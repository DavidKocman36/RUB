#!/usr/bin/env/ruby
require_relative "attributes.rb"
require_relative "validations.rb"
require_relative "klass.rb"
require_relative "item.rb"


cl = Klass.new

cl.name = "A"
p cl.valid?
p cl.errors

cl.size = -1
p cl.valid?
p cl.errors

p cl.validate
p cl.errors

#p cl.validate!

item = Item.new(name: "Bread", size: 5, something: true)
p item.name # => "Bread"
p item.size # => 5

item.name = "Baguette"
p item.name # => "Baguette"
#item.size = "XL" # => raises Error

item.size = nil
p item.size # => nil
#p item.name = nil # => raises Error

#Item.new # => raises Error / missing required attribute
#Item.new(name: "Bread", size: 5) # => raises Error / missing required attribute
#Item.new(name: 123, something: 'else') # => raises Error / invalid type
Item.new(name: 'Banana', something: false) # => OK / required attributes are present

