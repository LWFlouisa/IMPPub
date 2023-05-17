require "naive_bayes"

# Abstractions
abstraction_1  =        File.read("textimages/house.txt").to_s
abstraction_2  =       File.read("textimages/house2.txt").to_s
abstraction_3  = File.read("textimages/abstraction1.txt").to_s
abstraction_4  = File.read("textimages/abstraction2.txt").to_s
abstraction_5  =          File.read("images/clogs_1.txt").to_s
abstraction_6  =          File.read("images/clogs_3.txt").to_s
abstraction_7  =          File.read("images/clogs_5.txt").to_s
abstraction_8  =          File.read("images/clogs_6.txt").to_s
abstraction_9  =          File.read("images/clogs_7.txt").to_s
abstraction_10 =          File.read("images/clogs_8.txt").to_s
abstraction_11 =          File.read("images/clogs_9.txt").to_s
abstraction_12 =         File.read("images/clogs_10.txt").to_s

# Memories
first_person   = File.read("textimages/person1.txt").to_s
second_person  = File.read("textimages/person2.txt").to_s
third_person   = File.read("textimages/person3.txt").to_s
fourth_person  = File.read("textimages/person4.txt").to_s
fifth_person   = File.read("textimages/person5.txt").to_s
sixth_person   = File.read("textimages/person6.txt").to_s
seventh_person = File.read("textimages/person7.txt").to_s
eighth_person  = File.read("textimages/person8.txt").to_s
nineth_person  = File.read("textimages/person9.txt").to_s
tenth_person   = File.read("textimages/person10.txt").to_s

a             = NaiveBayes.new(:abstraction, :memory)
a.db_filepath = "_data/memories/mymemories.nb"

# These things are abstractions of images.
a.train(:abstraction,  abstraction_1, "word")
a.train(:abstraction,  abstraction_2, "word")
a.train(:abstraction,  abstraction_3, "word")
a.train(:abstraction,  abstraction_4, "word")
a.train(:abstraction,  abstraction_5, "word")
a.train(:abstraction,  abstraction_6, "word")
a.train(:abstraction,  abstraction_7, "word")
a.train(:abstraction,  abstraction_8, "word")
a.train(:abstraction,  abstraction_9, "word")
a.train(:abstraction, abstraction_10, "word")
a.train(:abstraction, abstraction_11, "word")
a.train(:abstraction, abstraction_12, "word")

# These things are direct memories.
a.train(:memory,   first_person, "word")
a.train(:memory,  second_person, "word")
a.train(:memory,   third_person, "word")
a.train(:memory,  fourth_person, "word")
a.train(:memory,   fifth_person, "word")
a.train(:memory,   sixth_person, "word")
a.train(:memory, seventh_person, "word")
a.train(:memory,  eighth_person, "word")
a.train(:memory,  nineth_person, "word")
a.train(:memory,   tenth_person, "word")

a.save
