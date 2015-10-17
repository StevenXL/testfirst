def add(first, second)
    first + second
end

def subtract(first, second)
    first - second
end

def sum(integers)
    total_sum = 0

    integers.each do |current_element|
        total_sum += current_element
    end

    total_sum
end
