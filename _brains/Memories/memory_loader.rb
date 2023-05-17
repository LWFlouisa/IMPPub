require "naive_bayes"

a = NaiveBayes.load('_data/memories/mymemories.nb') 

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

puts "#{first_result}
#{second_result}
#{third_result}
#{fourth_result}
#{fifth_result}
#{sixth_result}
#{seventh_result}"

#open("_posts/input.md", "w") { |f|
#  f.puts "#{first_result}
#{second_result}
#{third_result}
#{fourth_result}
#{fifth_result}
#{sixth_result}
#{seventh_result}
#"
#}
