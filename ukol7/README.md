# Currency converter

The currency converter command line application converts any currency to another that is available at ČNB.

## Installation

Depenedencies:
- Ruby 1.10+
- Thor
- Net-HTTP

The attached Gemfile will install all gems needed for this applicaion.
```
bundle install
```

## Usage

The main.rb is an excutable.
```
./main.rb SERVICE ARGUMENTS
```

The available services are:
- ./main.rb convert AMOUNT FROM_CURRENCY TO_CURRENCY
    - converts specified amount of one currency to another.

- ./main.rb list_rates
    - Prints a list of all available rates.

- ./main.rb help
    - Print usage.