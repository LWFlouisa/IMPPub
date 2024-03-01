## Haiku training model.
def get_haiku
  require "naive_bayes"

  # Get the date.
  system("date > _date/date.txt")

  # Immutables
  date             = File.read("_date/date.txt").strip
  date_title       = date.tr " ", "_"

  a             = NaiveBayes.new(:haiku, :nonhaiku)
  # a.db_filepath = "_data/haiku_data.nb"

  haiku    = File.readlines("_input/haiku_list.txt")
  nothaiku = File.readlines("_input/nonhaiku_list.txt")

  # The size of each document.
  haiku_size     = haiku.size.to_i
  not_haiku_size = nothaiku.size.to_i

  # The interval set to zero for each training set.
  haiku_interval    = 0
  nothaiku_interval = 0

  # Train on what is haiku.
  haiku_size.times do
    a.train(:haiku, "#{haiku[haiku_interval]}", "word")

    haiku_interval = haiku_interval + 1
  end

  # Train on what isn't haiku.
  not_haiku_size.times do
    a.train(:nothaiku, "#{nothaiku[nothaiku_interval]}", "word")

    nothaiku_interval = nothaiku_interval + 1
  end

  # Classifying an action input.
  b = File.readlines("_input/haiku_set.txt")

  # Classifies the next line from this interval.
  line_interval = 0

  total_size = b.size.to_i

  open("_posts/input.md", "w") { |f|
    f.puts "## #{date_title}"

    total_size.times do
      read_line = b[interval].to_s.split(" ")

      f.print a.classify(read_line)
      f.puts " "

      interval = interval + 1
    end
  }
end

## Constructed language training model.
def get_color
  require "naive_bayes"

  # Get the date.
  system("date > _date/date.txt")

  # Immutables
  date             = File.read("_date/date.txt").strip
  date_title       = date.tr " ", "_"

  a             = NaiveBayes.new(:color, :shade)
  # a.db_filepath = "_data/haiku_data.nb"

  color = File.readlines("_input/color_list.txt")
  shade = File.readlines("_input/shade_list.txt")

  # The size of each document.
  color_size = color.size.to_i
  shade_size = shade.size.to_i

  # The interval set to zero for each training set.
  color_interval = 0
  shade_interval = 0

  # Train on what is haiku.
  color_size.times do
    a.train(:color, "#{color[color_interval]}", "word")

    color_interval = color_interval + 1
  end

  # Train on what isn't haiku.
  shade_size.times do
    a.train(:shade, "#{shade[shade_interval]}", "word")

    shade_interval = shade_interval + 1
  end

  # Classifying an action input.
  b = File.readlines("_input/color_set.txt")

  # Classifies the next line from this interval.
  line_interval = 0

  total_size = b.size.to_i

  open("_posts/input.md", "w") { |f|
    f.puts "## #{date_title}"

    total_size.times do
      read_line = b[interval].to_s.split(" ")

      f.print a.classify(read_line)
      f.puts " "

      interval = interval + 1
    end
  }
end

## Decision Tree
require 'decisiontree'

read_value = File.read("_tree_input/interval.txt").to_s.to_i

input = read_value

attributes = ['Baysian Type']

training = [
  [   0.5,        'get_haiku' ],
  [ 100.0,        'get_color' ],
]

# Instantiate the tree, and train it based on the data (set default to '1')
dec_tree = DecisionTree::ID3Tree.new(attributes, training, 1, :continuous)
dec_tree.train

#print "What style? >> "; input + gets.chomp.to_f

test     = [input]
decision = dec_tree.predict(test)

## Chooses a haiku or color model based on results of test.
if    decision == "get_haiku"
  get_haiku
elsif decision == "get_color"
  get_color
end
