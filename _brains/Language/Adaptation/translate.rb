number = 0

# The actual dictionary of words to adapt.
dictionary = File.readlines("_input/dictionary/word_list.txt").sort

# Basing iteration limit on total dictionary size.
iter_limit = dictionary.size.to_i

alphabet = {
  # Vowels and consonants that remain the same.
  "B" => "B", "C" => "C",
  "G" => "G", "N" => "N",
  "K" => "K", "M" => "M",
  "P" => "P", "Q" => "Q",
  "T" => "T", "V" => "V",
  "W" => "W", "Z" => "Z", 

  # Vowel specific rules.
  "A" => "A", "I" =>  "",
  "O" => "O", "U" =>  "U",
  "E" => "E", "Y" => "XY",

  # Relevant consonant shifts.
  "D" =>  "D", "F" =>  "Z",
  "S" =>  "Z", "R" =>  "D",
  "L" =>  "H", "J" =>  "N",
  "X" => "XY", "H" =>  "H",

  " " => " ",
}

# Limits the iteration to the size of the actual dictionary.
open("_posts/input.md", "w") { |f|
  iter_limit.times do
    chosen_word = dictionary[number].upcase

    # What is displayed in the terminal.
    print "\nResult: #{chosen_word.downcase.strip} => "

    # What actually gets written to XML document.
    f.print "\nResult: #{chosen_word.downcase.strip} => "

    word_length    = chosen_word.to_s.split("")
    word_iteration = word_length.size.to_i
    word_char = 0

    word_iteration.times do
      char = alphabet[chosen_word[word_char]].to_s

      # What is displayed in the terminal.
      print char.downcase

      # What actually gets written to XML doucment.
      f.print char.downcase

      word_char = word_char + 1
    end

    puts " "
    f.puts " "

    # Prevents stack level going to deep.
    sleep(0.5)

    number = number + 1
  end
}
