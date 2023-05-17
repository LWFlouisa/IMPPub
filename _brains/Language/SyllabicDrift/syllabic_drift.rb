old_output = File.read("_feed/old_feed.txt")

# Get the date.
system("date > _date/date.txt")

# Immutables
date             = File.read("_date/date.txt").strip
date_title       = date.tr " ", "_"

# Means Over Time Calculation

print                                                 "Starting year: "; year_number = gets.chomp.to_i
print                              "How many years of syllabic drift: "; syllable_drift_years = gets.chomp.to_i
print                        "How many syllables increase each year?: "; syllabic_increase_int = gets.chomp #.to_i
print  "Syllable length for each line ( five numbers) for first poem: "; syllable_length_one = gets.chomp.split("-")
print "Syllable length for each line ( five numbers) for second poem: "; syllable_length_two = gets.chomp.split("-")

# Syllabic values for poem one.
syllable_length_one_p1 = syllable_length_one[0].to_i
syllable_length_two_p1 = syllable_length_one[1].to_i
syllable_length_tre_p1 = syllable_length_one[2].to_i
syllable_length_fro_p1 = syllable_length_one[3].to_i
syllable_length_fiv_p1 = syllable_length_one[4].to_i

# Syllabic values for poem two.
syllable_length_one_p2 = syllable_length_two[0].to_i
syllable_length_two_p2 = syllable_length_two[1].to_i
syllable_length_tre_p2 = syllable_length_two[2].to_i
syllable_length_fro_p2 = syllable_length_two[3].to_i
syllable_length_fiv_p2 = syllable_length_two[4].to_i

# Some of comparison 1
row_1 = syllable_length_one_p1 + syllable_length_one_p2; average_1 = row_1 / 2

# Some of comparison 2
row_2 = syllable_length_two_p1 + syllable_length_two_p2; average_2 = row_1 / 2

# Some of comparison 3
row_3 = syllable_length_tre_p1 + syllable_length_tre_p2; average_3 = row_1 / 2

# Some of comparison 4
row_4 = syllable_length_fro_p1 + syllable_length_fro_p2; average_4 = row_1 / 2

# Some of comparison 5
row_5 = syllable_length_fiv_p1 + syllable_length_fiv_p2; average_5 = row_1 / 2

syllabic_increase_int = syllabic_increase_int.to_i

open("_posts/input.md", "w") { |f|
  f.puts "## #{date_title}"

  syllable_drift_years.times do

    output_1 = average_1 + syllabic_increase_int
    output_2 = average_2 + syllabic_increase_int
    output_3 = average_3 + syllabic_increase_int
    output_4 = average_4 + syllabic_increase_int
    output_5 = average_5 + syllabic_increase_int

    output_1 = output_1.to_s
    output_2 = output_2.to_s
    output_3 = output_3.to_s
    output_4 = output_4.to_s
    output_5 = output_5.to_s

    f.puts "### For year of #{year_number}: "

    f.puts "<pre>Average syllabic mean for line one is " + output_1 + " syllables in year #{year_number}."
    f.puts "Average syllabic mean for line two is "      + output_2 + " syllables in year #{year_number}."
    f.puts "Average syllabic mean for line tre is "      + output_3 + " syllables in year #{year_number}."
    f.puts "Average syllabic mean for line fro is "      + output_4 + " syllables in year #{year_number}."
    f.puts "Average syllabic mean for line fiv is "      + output_5 + " syllables in year #{year_number}.</pre>"

    year_number = year_number + 1

    # Modulus keeps syllabic amount to a reasonable limit.
    #modulus = syllabic_increase_int + syllabic_increase_int

    syllabic_increase_int = syllabic_increase_int + syllabic_increase_int

    if syllabic_increase_int >= 13
      syllabic_increase_int = syllabic_increase_int % 13 # Six being the mean value.
    end
  end
}
