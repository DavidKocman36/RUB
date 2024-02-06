#!/usr/bin/env ruby

require 'thor'
require_relative 'converter.rb'

class Main < Thor
    def self.exit_on_failure?
        true
    end

    desc 'convert {AMOUNT} {FROM_CURRENCY} {TO_CURRENCY}', 'Converts a supplied currency into a specified amount of another currency'

    def convert(amount, currency1, currency2)
        Converter.convert(amount, currency1, currency2)
    end

    desc 'list_rates', 'Lists current conversion rates.'
    def list_rates()
        Converter.list_rates()
    end

    desc 'help', 'Prints out help.'
    def help()
        puts "USAGE: ./main.rb SERVICE ARGUMENTS"
        puts
        puts "Service and its arugemts may be:"
        puts "\tconvert {AMOUNT} {FROM_CURRENCY} {TO_CURRENCY} - Converts specified amount in FROM_CURRENCY to the TO_CURRENCY."
        puts "\tlist_rates - Prints the most recent list of rates to CZK. No arguments."
        puts "\thelp - Prints help."
    end
end

Main.start