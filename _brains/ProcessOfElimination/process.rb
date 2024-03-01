# Get the date.
system("date > _date/date.txt")

# Immutables
date             = File.read("_date/date.txt").strip
date_title       = date.tr " ", "_"

## Determining user data and user choice.
value = File.read("_input/user/user_choice.txt").to_s.to_i

user_data   = File.readlines("_data/user/candidates.txt")
user_choice = user_data[value]

## Processing AI focused data
ai_choice            = File.read("_data/ai/ai_choice.txt").to_s.to_i
ai_initial_candidate = user_data[ai_choice]
ai_search_limit      = user_data.size.to_i

## Create AI data from user data.
ai_search_limit.times do
  if ai_choice == user_choice
    puts "The specific candidate was found. Terminating selection..."

    ai_data      = user_data.slice!(ai_choice)

    open("_data/ai/candidates.txt", "w") { |f|
      f.puts ai_data
    }
  else
    puts "The specific candidate is not found..."
  end
end

## AI processing data.
ai_choice            = File.read("_data/ai/ai_choice.txt").to_s.to_i
ai_data              = File.readlines("_data/ai/candidates.txt")
ai_search_limit      = ai_data.size.to_i
ai_next_candidate    = ai_data[ai_choice]

ai_search_limit.times do
  if ai_next_candidate == user_choice
    ai_final_candidate = ai_next_candidate
    
    puts "Candidate found, processing input..."; sleep(1)

    open("_posts/input.md", "w") { |f|
      f.puts "## #{date_title}"
      f.puts "By process of elimination, the bot chose: #{ai_final_candidate}"
    }
  else
    puts "Candidate is not yet found..."

    ai_choice            = File.read("_data/ai/ai_choice.txt").to_s.to_i
    ai_data              = File.readlines("_data/ai/candidates.txt")
    ai_search_limit      = ai_data.size.to_i
    ai_next_candidate    = ai_data[ai_choice]

    ai_data      = user_data.slice!(ai_choice)

    open("_data/ai/candidates.txt", "w") { |f|
      f.puts ai_data
    }
  end
end
