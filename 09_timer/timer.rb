# the purpose of this excercise is to learn about formatting strings in Ruby

# Formatting strings in Ruby requires knowledge of the sprintf Kernel module
# method. The documentation for this method can be found here:
# http://www.ruby-doc.org/core-2.2.0/Kernel.html#method-i-sprintf

# The important thing to note is that the method is invoked using the following
# syntax:

# sprintf("format_string")

# the "format_string" takes the following arguments below; note that the
# percent sign is required, as is the type. However, flags, width, and
# precision are option. More on each of these can be found in the
# documentation. 

# %[flags][width][.precision]type

# another cool aspect of this example is that we used the "self" keyword to
# refer to the object created after initialization. Notice that, in the
# time_string method, we use self.transform to call the transform method before
# we format the string. The transform method updates our instance variables,
# and then we format that variables

# it is not necessary to use self.transform. "transform" would have worked just
# as well. 

class Timer
    attr_accessor :seconds

    def initialize
        @seconds = 0
        @seconds_in_an_hour = 60 * 60
        @seconds_in_a_minute = 60
    end

    # number of hours, minutes, and seconds left
    def transform
        @hours_left   =  @seconds /  @seconds_in_an_hour
        @seconds_left =  @seconds - (@seconds_in_an_hour * @hours_left)
        @minutes_left = @seconds_left / @seconds_in_a_minute
        @seconds_left = @seconds_left - (@seconds_in_a_minute * @minutes_left)
    end

    def time_string
        self.transform
        return sprintf("%02d:%02d:%02d", @hours_left, @minutes_left, @seconds_left)
    end
end
