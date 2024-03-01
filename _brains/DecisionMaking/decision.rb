require 'decisiontree'

system("date > _date/date.txt")

# Immutables
date             = File.read("_date/date.txt").strip
date_title       = date.tr " ", "_"

read_value = File.read("_tree_input/interval.txt").to_s.to_i

input = read_value

attributes = ['Style']

training = [
  [    0.5, 'Wooden Shoes Roses Choker Pantalons Goth_Tee_1' ],
  [   6.87, 'Wooden Shoes Roses Choker Pantalons Goth_Tee_2' ],
  [  13.75,  'Wooden Shoes Bows Choker Pantalons Goth_Tee_1' ],
  [ 20.625,  'Wooden Shoes Bows Choker Pantalons Goth_Tee_2' ],
  [   27.5,    'Tap Shoes Roses Choker Pantalons Goth_Tee_1' ],
  [  38.75,    'Tap Shoes Roses Choker Pantalons Goth_Tee_2' ],
  [ 44.375,     'Tap Shoes Bows Choker Pantalons Goth_Tee_1' ],
  [   50.0,     'Tap Shoes Bows Choker Pantalons Goth_Tee_2' ],
  [  56.25,     'Arizonas Roses Choker Pantalons Goth_Tee_1' ],
  [   62.5,     'Arizonas Roses Choker Pantalons Goth_Tee_2' ],
  [   80.0,      'Arizonas Bows Choker Pantalons Goth_Tee_1' ],
  [   75.0,      'Arizonas Bows Choker Pantalons Goth_Tee_2' ],
  [  81.25,      'Bostons Roses Choker Pantalons Goth_Tee_1' ],
  [   87.5,      'Bostons Roses Choker Pantalons Goth-Tee_2' ],
  [  93.75,       'Bostons Bows Choker Pantalons Goth_Tee_1' ],
  [  100.0,       'Bostons Bows Choker Pantalons Goth_Tee_2' ],
]

# Instantiate the tree, and train it based on the data (set default to '1')
dec_tree = DecisionTree::ID3Tree.new(attributes, training, 1, :continuous)
dec_tree.train

#print "What style? >> "; input + gets.chomp.to_f

test     = [input]
decision = dec_tree.predict(test)

open("_posts/input.md", "w") { |f|
  f.puts "## #{date_title}"
  f.puts "Decision: #{decision}"
}
