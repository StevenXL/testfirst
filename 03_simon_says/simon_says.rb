def echo(output)
    output
end

def shout(output)
    output.upcase
end

def repeat(output,reps=2)
    return if reps == 0

    # we need to seperate the first output because it is formatted differently. 
    # The first output has no initial space.
    repeating_word = "#{output}"
    (reps - 1).times { repeating_word << " #{output}" }

    return repeating_word
end

def start_of_word(word, amount=1)
    word[0, amount]
end

def first_word(sentence)
    sentence[0, sentence.index(" ")]
end

def titleize(word)
    little_words = ["and", "the", "over"]

    split_sentence = word.downcase.split(' ')

    split_sentence.each_index do |current_index|
        if (current_index == 0)
            split_sentence[current_index] = split_sentence[current_index].downcase.capitalize
        elsif (little_words.include?(split_sentence[current_index]))
        else
            split_sentence[current_index] = split_sentence[current_index].downcase.capitalize
        end
    end

    return split_sentence.join(' ')
end
