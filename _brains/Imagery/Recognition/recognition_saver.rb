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

a.db_filepath = "_data/imagery/image_recognition.nb"

# Train the labels on the images of shapes in ASCII art.
a.train(:This_is_a_picture_of_a_square,     square, "word")
a.train(:This_is_a_picture_of_a_circle,     circle, "word")
a.train(:This_is_a_picture_of_a_triangle, triangle, "word")

a.save
