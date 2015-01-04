# the purpose of this exercise is to teach about option hashes. 
# option hashes are explained here:

# http://stackoverflow.com/questions/18407618/what-are-options-hashes

# the way option hashes work is that the last parameter of a method is expected
# to be a hash, and defaults to an empty hash if if it not included in the
# arguments

# the call to the method would be:
# Class.method(arg1, arg2, {opt1: true, opt2: false})

# in fact, an option hash is so fundamental to Ruby, that you can exclude the
# curly braces:
# Class.method(arg1, arg2, opt1: true, opt2: false)

# the other point of this lecture is to understand the difference between a
# class method and an instance method. A class method is defined within the
# class with the following syntax:
# def self.method_name(parameter)
# notice the use of the keyword self. A class method is a method that can be
# called on a class, without creating an instance of that class. 

# If we don't
# specify that a method is a class method via the self keyword, then the method
# is an instance method, and can only be called after an instance of that class
# is created

# in this exercise, we are using a class method to impliment a "factory
# constructor. A factory constructor is a way to define a class method that
# then creates a new instance. In this case, we don't have to pass options to
# the class method. We know that by calling a specific class method, we want
# certain "options enabled", and that is what we then pass to our regular
# constructor to initialize the instance. In this case, by calling the class
# method from_celsius, our user is telling us that he is passing in the
# temperature in celsius, and thus we can call our regular constructor with the
# {c: celsius} options


class Temperature
    def self.from_celsius(celsius)
        Temperature.new({c: celsius})
    end

    def self.from_fahrenheit(fahrenheit)
        Temperature.new({f: fahrenheit})
    end

    def initialize(options = {})
        options[:f] ? @temp_f = options[:f] : @temp_c = options[:c]

        if @temp_f
            @temp_c = (@temp_f - 32) * (5.0 / 9.0)
        else
            @temp_f = @temp_c * 9.0 / 5.0 + 32
        end
    end

    def in_fahrenheit
        @temp_f
    end

    def in_celsius
        @temp_c
    end
end

# the last pieces of code here are to teach us about inheritance in Ruby.
# Notice the syntax that we used to create the subclasses Celsius and
# Fahrenheit from the superclass Temperature.

# Notice also the use of the super
# keyword. What super does is it goes to the parent class (in our case
# Temperature) and calls the same method in the parent class that is calling
# super. So in our case, super is being called by the initialize method; we
# will then go to our subclass's parent class (Temperature) and execute the
# parent class's initialize method. Furthermore, super will also pass into the
# parent method we execute the arguments we pass into super. 

# inheritance is further explained here:
# http://rubylearning.com/satishtalim/ruby_inheritance.html

class Celsius < Temperature
    def initialize(celsius)
        super({c: celsius})
    end
end

class Fahrenheit < Temperature
    def initialize(fahrenheit)
        super({f: fahrenheit})
    end
end
