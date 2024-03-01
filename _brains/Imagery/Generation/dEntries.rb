image_sorted = Dir.entries("images/.").sort

puts image_sorted

image_1 = image_sorted[2].to_s
image_2 = image_sorted[3].to_s

puts "For image in #{image_sorted}: select #{image_2}"

system("jp2a images/#{image_2}")
