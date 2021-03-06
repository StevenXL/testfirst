# note, I have issues when working with attr_reader, attr_writter_, and
# attr_accessor. There is a good description of what these are at:
# stackoverflow.com/questions/5046831/why-use-rubys-attr-accessor-attr-reader-aand-attr-writer
#
# in order to understand what is actually going on, it is easiest to actually
# look at what these keywords get translated to. For example:

# attr_writer: age
# def age=(value)
#   @age = value
# end

# attr_reader: age
# def age
#   @age
# end

# of course, attr_accessor is a shorthand for both of these! 

# In the class below, what was really confusing is that we had an instance
# variable called @title, which we had to make read / write-able with
# attr_accessor, and we had a method called title which took the instance
# variable title and changed it! So, when the user "sets" the title, using
# something like book.title = "To Kill a Mockingbird", they are simultenously,
# setting the instance variable @title to the string, and then they are calling
# the method title to change the @instance title
class Book
    attr_accessor :title

    @@conjunctions = ["and", "a"]
    @@propositions = ["in", "the", "of"]
    @@articles = ["an"]

    def title
    # turn our title string into an array
    title_parts = @title.split(' ')

    # for each title part, capitalize the first letter
    title_parts.each_index do |current_index|
        if current_index == 0 or (!((@@conjunctions + @@propositions + @@articles).include?(title_parts[current_index])))
            title_parts[current_index] = title_parts[current_index].capitalize
        end
    end

    # join our new title collection of title parts into a string
    @title = title_parts.join(" ")
    end
end
