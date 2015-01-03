# i have a hard time coding with the splat operator (used in the translate
# method below). Let's review how the splat operator works:
# 
# The splat operator is used to create methods that have a variable parameter
# list - i.e., they can take any number of parameters. This parameter list is,
# in fact, a list, and what the splat operator does is it converts that list
# into an array. (This is according to Ruby Monk - I was under the impression
# that, in Ruby, a list is an array). 
#
# After conversion, the array is referenced without the splat operator. But the
# key, again, is that it converts the parameters into an array!

def translate(string)
    output = Array.new 

    # turn our string into an array
    words = string.split(' ')

    # run each element in the array through our single-world translator method
    words.each do |single_word|
        output << translate_single_word(single_word)
    end

    return output.join(" ")
end

def translate_single_word(english)
    # our vowels
    vowels = ["a", "e", "i", "o", "u"]

    # append to convert from english to pig latin 
    pig_appendage = "ay" 
    
    # does the word contain 'qu
    if english.slice(0, 3).index("qu")
        english[0] == "q" ? first_vowel = 2 : first_vowel = 3
    else
        # where does the first vowel occur
        first_vowel = english.index(/[aeiou]/)
    end

    # take whatever is before the first vowel, and append it to the word
    # then append pig_appendage to make it into pig latin
    english << english.slice(0, first_vowel) << pig_appendage

    # skip over first consonant and return that substring 
    return english[first_vowel..-1]
end
