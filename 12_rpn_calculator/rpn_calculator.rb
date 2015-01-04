class RPNCalculator
    attr_reader :value
    @@integers = (0..9).to_a
                 
    def initialize
    @stack = Array.new
    @value = 0
    end

    def push(integer)
        @stack << integer
    end

    def plus
        if @stack.length >= 2
            @value = @value + @stack[-2] + @stack[-1] 
            @stack.pop(2)
        elsif @stack.length > 0
            @value = @value + @stack[0]
            @stack.pop
        else
            raise("calculator is empty")
        end
    end

    def minus 
        if @stack.length >= 2
            @value = @stack[-2] - @stack[-1] 
            @stack.pop(2)
        elsif @stack.length > 0
            @value = @value - @stack[0]
            @stack.pop
        else
            raise("calculator is empty")
        end
    end

    def times 
        if @stack.length >= 2
            @value = @stack[-2].to_f * @stack[-1] 
            @stack.pop(2)
        elsif @stack.length > 0
            @value = @value.to_f * @stack[0]
            @stack.pop
        else
            raise("calculator is empty")
        end
    end

    def divide
        if @stack.length >= 2
            @value = @stack[-2].to_f / @stack[-1] 
            @stack.pop(2)
        elsif @stack.length > 0
            @value = @value.to_f / @stack[0]
            @stack.pop
        else
            raise("calculator is empty")
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
    end
end
