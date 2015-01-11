class RPNCalculator
    attr_reader :value

    def initialize
        @stack = Array.new
        @value = 0 
    end

    def push(integer)
        @stack << integer
    end

    def plus
        operands = @stack.pop(2)

        if operands.size == 0
            raise("calculator is empty")
        else
            @value = operands[0] + operands[1]
            @stack << @value
        end
    end

    def minus 
        operands = @stack.pop(2)
        
        if operands.size == 0
            raise("calculator is empty")
        else
            @value = operands[0] - operands[1]
            @stack << @value
        end
    end

    def times 
        operands = @stack.pop(2)
        
        if operands.size == 0
            raise("calculator is empty")
        else
            @value = operands[0] * operands[1]
            @stack << @value
        end
    end

    def divide
        operands = @stack.pop(2)

        if operands.size == 0
            raise("calculator is empty")
        else
            @value = operands[0].to_f / operands[1].to_f
            @stack << @value
        end
    end

    def tokens(string)
        original = string.split(" ")
        converted = Array.new

        original.each do |element|
            if element.to_i == 0
                converted << element.to_sym
            else
                converted << element.to_i
            end
        end
        
        return converted 
    end

    def evaluate(string)
        tokenized = tokens(string)

        tokenized.each do |element|
            if element.is_a?(Integer) 
                push(element)
            else
                case element
                when :+
                    plus
                when :-
                    minus
                when :*
                    times
                when :/
                    divide
                end
            end
        end

        return @value
    end
end
