def reverser
    # yield control flow to the default block
    string = yield

    # convert string to an array of words
    words = string.split(" ")

    # reverse each word in our word array
    words.each_index do |index|
        words[index] = words[index].reverse
    end

    # join our reversed words array into a string
    return words.join(" ")
end

def adder(increase = 1)
    number = yield
    number += increase
end

def repeater(repeat = 1)
    repeat.times { yield }
end
