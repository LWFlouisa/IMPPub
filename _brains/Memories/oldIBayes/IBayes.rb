require "naive_bayes"

# Abstractions
abstraction_1 = File.read("textimages/house.txt").to_s
abstraction_2 = File.read("textimages/house2.txt").to_s
abstraction_3 = File.read("textimages/abstraction1.txt").to_s
abstraction_4 = File.read("textimages/abstraction2.txt").to_s

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

person_01 = first_person
person_02 = second_person
person_03 = third_person
person_04 = fourth_person
person_05 = fifth_person
person_06 = sixth_person
person_07 = seventh_person
person_08 = eighth_person
person_09 = nineth_person
person_10 = tenth_person

a = NaiveBayes.new(:abstraction, :memory)

# These things are abstractions of images.
a.train(:abstraction, abstraction_1, "word")
a.train(:abstraction, abstraction_2, "word")
a.train(:abstraction, abstraction_3, "word")
a.train(:abstraction, abstraction_4, "word")

# These things are direct memories.
a.train(:memory, person_01, "word")
a.train(:memory, person_02, "word")
a.train(:memory, person_03, "word")
a.train(:memory, person_04, "word")
a.train(:memory, person_05, "word")
a.train(:memory, person_06, "word")
a.train(:memory, person_07, "word")
a.train(:memory, person_08, "word")
a.train(:memory, person_09, "word")
a.train(:memory, person_10, "word")

b = File.read("input/house1.txt").to_s
c = File.read("input/house2.txt").to_s
d = File.read("input/person1.txt").to_s
e = File.read("input/person2.txt").to_s
f = File.read("input/person3.txt").to_s
g = File.read("input/person4.txt").to_s
h = File.read("input/person5.txt").to_s

first_result   = a.classify(b)
second_result  = a.classify(c)
third_result   = a.classify(d)
fourth_result  = a.classify(e)
fifth_result   = a.classify(f)
sixth_result   = a.classify(g)
seventh_result = a.classify(h)

open("_posts/input.md", "w") { |f|
  f.puts "## _Results_
That is a #{first_result[0]}.
That is a #{second_result[0]}.
That is a #{third_result[0]}.
That is a #{fourth_result[0]}.
That is a #{fifth_result[0]}.
That is a #{sixth_result[0]}.
That is a #{seventh_result[0]}."
}
