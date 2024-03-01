require 'decisiontree'

attributes = ['Tuning']

hz = File.read("_input/standard.txt").to_s.to_i

training = [

    # Base Clef
    [130.8130,          "C is ( base clef ) 130.8130 Hz in 12TET equal temperament."],
    [138.5900,   "C# or Db is ( base clef ) 138.5900 Hz in 12TET equal temperament."],
    [146.8320,          "D is ( base clef ) 146.8320 Hz in 12TET equal temperament."],
    [155.5630,   "D# or Eb is ( base clef ) 155.5630 Hz in 12TET equal temperament."],
    [164.8410,          "E is ( base clef ) 164.8410 Hz in 12TET equal temperament."],
    [174.6140,          "F is ( base clef ) 174.6140 Hz in 12TET equal temperament."],
    [184.9970,   "F# or Gb is ( base clef ) 184.9970 Hz in 12TET equal temperament."],
    [195.9980,          "G is ( base clef ) 195.9980 Hz in 12TET equal temperament."],
    [207.6520,   "G# or Ab is ( base clef ) 207.6520 Hz in 12TET equal temperament."],
    [220.0000,          "A is ( base clef ) 220.0000 Hz in 12TET equal temperament."],
    [233.0820,   "A# or Bb is ( base clef ) 233.0820 Hz in 12TET equal temperament."],
    [246.9420,          "B is ( base clef ) 246.9420 Hz in 12TET equal temperament."],

    # Treble Clef
    [261.6260,        "C is ( treble clef ) 261.6260 Hz in 12TET equal temperament."],
    [277.1830, "C# or Db is ( treble clef ) 277.1830 Hz in 12TET equal temperament."],
    [293.6650,        "D is ( treble clef ) 293.6650 Hz in 12TET equal temperament."],
    [311.1270, "D# or Eb is ( treble clef ) 311.1270 Hz in 12TET equal temperament."],
    [329.6280,        "E is ( treble clef ) 329.6280 Hz in 12TET equal temperament."],
    [349.2280,        "F is ( treble clef ) 349.2280 Hz in 12TET equal temperament."],
    [369.9940, "F# or Gb is ( treble clef ) 369.9940 Hz in 12TET equal temperament."],
    [391.9950,        "G is ( treble clef ) 391.9950 Hz in 12TET equal temperament."],
    [415.3050, "G# or Ab is ( treble clef ) 415.3050 Hz in 12TET equal temperament."],
    [440.0000,        "A is ( treble clef ) 440.0000 Hz in 12TET equal temperament."],
    [466.1640, "A# or Bb is ( treble clef ) 466.1640 Hz in 12TET equal temperament."],
    [493.8830,        "B is ( treble clef ) 493.8830 Hz in 12TET equal temperament."],
    [523.2510,        "C is ( treble clef ) 523.2510 Hz in 12TET equal temperament."],
]

# Instantiate the tree, and train it based on the data (set default to '1')
dec_tree = DecisionTree::ID3Tree.new(attributes, training, 1, :continuous)
dec_tree.train

test     = [hz]
decision = dec_tree.predict(test)

# puts "Decision: #{decision}"

open("_posts/input.md", "w") { |f|
  f.puts "<pre>"

  f.puts "Standard Tuning: #{decision}"

  f.puts "</pre>"
}
