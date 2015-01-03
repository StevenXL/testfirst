def translate(string)
    return translate_single_word(string)
end

def translate_single_word(english)
    # our vowels
    vowels = ["a", "e", "i", "o", "u"]

    # append to convert from english to pig latin 
    pig_appendage = "ay" 
    
    # where does the first vowel occur
    first_vowel = english.index(/[aeiou]/)

    # take whatever is before the first vowel, and append it to the word
    # then append pig_appendage to make it into pig latin
    english << english.slice(0, first_vowel) << pig_appendage

    # skip over first consonant and return that substring 
    return english[first_vowel..-1]
end
