# Strings
puts "Hello World"

# Numbers
puts 3+2
puts 3*2

# Variables
hello_message = "Hello Dan"

puts hello_message

# Functions!

def hi(name = "World")
  "Hello #{name}"
end

puts hi("Dan")
puts hi("Joel")
puts hi()

# Modules/Classes
puts Math.sqrt(9)

# Math is a built-in module for mathematics. Modules serve two roles in Ruby.
# This shows one role: grouping similar methods together under a familiar name.
# Math also contains methods like sin() and tan().


# To understand what's happening, we will build a calculator that can add and
# square numbers.

def add(number1, number2)
  number1 + number2
end

puts add(10, 9)

def square(number)
  number * number
end

puts square(3)

# Those are functions that do math. And having some standalone functions
# is nice, but what if we wanted them to be grouped together, similar to Math.

# Classes group together functions!

class MyCalculator
  def add(number1, number2)
    number1 + number2
  end

  def square(number)
    number * number
  end
end

calculator = MyCalculator.new
puts calculator.square(3)


# Here's another example using our Hello World theme. This time we see that
# classes can also contain variables, called instance variables, besides just functions.

class Greeter
  def initialize(name = "World")
    @name = name
  end

  def say_hi
    puts "Hi #{@name}!"
  end

  def say_bye
    puts "Bye #{@name}, come back soon."
  end
end

dan_greeter = Greeter.new("Dan")
dan_greeter.say_hi
dan_greeter.say_bye
