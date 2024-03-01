# Get the date.
system("date > _date/date.txt")

# Immutables
date             = File.read("_date/date.txt").strip
date_title       = date.tr " ", "_"

spice_type = [
  "Tumeric",
  "Cumin",
  "Cayenne",
  "Chilly powder",
  "Crushed peppers",
  "Garlic powder",
  "Onion powder",
  "Cocao powder",
  "Cinnamon",
]

total_spices = spice_type.size.to_i
spice_interval = 0

spoon_size = [  "1/8 ",     "1/4 ",   "1/2 ", "1 ",
                "1 1/8 ", "1 1/4th ", "1 1/2 ", "2 ", 
                "2 1/8 ", "2 1/4th ", "2 1/2 ", "3 "]

spoon_type = ["teaspoon ", "tablespoon ", "cup ", "shotglass "]

# Spice increment should be a seperate measurement.
spice_increment = spoon_type.sample

if spice_increment == File.read("_values/heat_tolerance.txt").strip.to_s


tumeric        = "#{spice_type[0]} #{spoon_size.sample} #{spoon_type.sample}"
cumin          = "#{spice_type[1]} #{spoon_size.sample} #{spoon_type.sample}"
cayenne        = "#{spice_type[2]} #{spoon_size.sample} #{spoon_type.sample}"
chillypowder   = "#{spice_type[3]} #{spoon_size.sample} #{spice_increment}"
crushedpeppers = "#{spice_type[4]} #{spoon_size.sample} #{spice_increment}"
garlicpowder   = "#{spice_type[5]} #{spoon_size.sample} #{spoon_type.sample}"
onionpowder    = "#{spice_type[6]} #{spoon_size.sample} #{spoon_type.sample}"
cocaopowder    = "#{spice_type[7]} #{spoon_size.sample} #{spoon_type.sample}"
cinnamon       = "#{spice_type[7]} #{spoon_size.sample} #{spoon_type.sample}"

# Checks to make sure chilly powder isn't to much.


# Generate random spice mixture.
open("_posts/input.md", "w") { |f|
  f.puts "## #{date_title}"
  f.puts "## #{spice_type[spice_interval]} Mix"

  total_spices.times do
    f.print spoon_size.sample
    f.print spoon_type.sample
    f.puts " #{spice_type[spice_interval]}"
    f.puts

    spice_interval = spice_interval + 1
  end
}
