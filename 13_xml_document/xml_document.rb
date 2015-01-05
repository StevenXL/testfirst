# one of the key lessons here is th use of method_missing. 
# method_missing is defined as any other method in Ruby, but it is called
# whenever the object is passed a method, and there is no method definition.
# method_missing is passed 1) the symbol of the non-existant method, 2) an
# array of arguments that were passed to the original method, 3) the block
# passed to the original method

class XmlDocument
    def hello(options = {})
        if options.empty?
            '<hello/>'
        else
            output = '<hello' 
            options.each do | attribute, value |
                output << " " + attribute.to_s + "='" + value.to_s + "'"
            end
            output << "/>"

            return output
        end
    end

    def method_missing(tag_name)
        "<#{tag_name}/>"
    end
end
