## You only need to clear the screen if using it independantly.
# system("clear")

# Converts interval value in document to a number it can actually use.
interval    = File.read("Index/interval_value.txt").strip.to_s.to_i

# A list of all possible words to find the definition for.
word_index = File.readlines("Glossary/word_list.txt")

# A list of all possible definitions in the glossary.
definition_index = File.readlines("Glossary/definition_list.txt")

## Retrieving specific words and definitions.
chosen_word = word_index[interval]
chosen_defi = definition_index[interval]

# Waits a few milliseconds to search for definition.
sleep(2)

open("_posts/index.md", "w") { |f|
  f.puts "## #{chosen_word}"
  f.puts "#{chosen_defi}"
}
