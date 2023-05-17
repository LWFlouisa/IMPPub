require 'decisiontree'

attributes = ['Tuning']

# Gets the hertz frequency and converting to to an integer.
hz = File.read("_input/xenharmonic.txt").to_s.to_i

training = [
    [240.01200,      "Ne is a tonal value is 240.01200 Hz."], # Ne      240.01200
    [247.14800, "Ne Pont is a tonal value is 247.14800 Hz."], # Ne ^    247.14800
    [254.28400,      "Wo is a tonal value is 254.28400 Hz."], # Wo      254.28400
    [287.33075, "We Pont is a tonal value is 287.33075 Hz."], # Wo ^    287.33075
    [320.37750,      "Re is a tonal value is 320.37750 Hz."], # Re      320.37750
    [329.90275, "Re Pont is a tonal value is 329.90275 Hz."], # Re ^    329.90275
    [339.42800,      "Ro is a tonal value is 339.42800 Hz."], # Ro      339.42800
    [360.21125, "Ro Pont is a tonal value is 360.21125 Hz."], # Ro ^    360.21125
    [380.99450,      "Vi is a tonal value is 380.99450 Hz."], # Vi      380.99450
    [430.50900, "Vi Pont is a tonal value is 430.50900 Hz."], # Vi ^    430.50900
    [480.02350,      "Xi is a tonal value is 480.02350 Hz."], # Xi      480.02350
    [494.29525, "Xi Pont is a tonal value is 494.29525 Hz."], # Xi ^    494.29525
    [508.56700,      "Ve is a tonal value is 508.56700 Hz."], # Ve      508.56700
]

# Instantiate the tree, and train it based on the data (set default to '1')
dec_tree = DecisionTree::ID3Tree.new(attributes, training, 1, :continuous)
dec_tree.train

test     = [hz]
decision = dec_tree.predict(test)

# puts "NeWo Solfege Tone: #{decision}"

open("_posts/input.md", "w") { |f|
  f.puts "<pre>"

  f.puts "NeWo Solfege Tone: #{decision}"

  f.puts "</pre>"
}
