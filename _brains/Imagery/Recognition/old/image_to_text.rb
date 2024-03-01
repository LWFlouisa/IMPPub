# Require Ruby gems
require "naive_bayes"
require 'decisiontree'

# Converting images to ASCII art.
system("    jp2a _images/square.jpg > _input/square.txt;
            jp2a _images/circle.jpg > _input/circle.txt;
        jp2a _images/triangle.jpg > _input/triangle.txt;")

# Reads in image text as input.
square   =   File.read("_input/square.txt").to_s
circle   =   File.read("_input/circle.txt").to_s
triangle = File.read("_input/triangle.txt").to_s

# Make the labels of Naive base resemble naturalistic descriptions.
a = NaiveBayes.new(  :This_is_a_picture_of_a_square,
                     :This_is_a_picture_of_a_circle,
                     :This_is_a_picture_of_a_triangle, )

# Train the labels on the images of shapes in ASCII art.
a.train(:This_is_a_picture_of_a_square,     square, "word")
a.train(:This_is_a_picture_of_a_circle,     circle, "word")
a.train(:This_is_a_picture_of_a_triangle, triangle, "word")

# Classify types of shapes.
square_result = a.classify(square)
circle_result = a.classify(circle)
triangle_result = a.classify(triangle)


## Assign the results of the shape and probability.
# shape       = result[0].to_s.tr "_", " "
# probability = result[1]

this_square   = "#{square_result[0].to_s.tr '_', ' '}"
this_circle   = "#{circle_result[0].to_s.tr '_', ' '}"
this_triangle = "#{triangle_result[0].to_s.tr '_', ' '}"

puts "#{this_square}.
#{this_circle}.
#{this_triangle}."
