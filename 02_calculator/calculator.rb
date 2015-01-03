def add(first, second)
    return first + second
end

def subtract(first, second)
    return first - second
end

def sum(integers)
    total_sum = 0

    integers.each do |current_element|
        total_sum += current_element
    end

    return total_sum
end
