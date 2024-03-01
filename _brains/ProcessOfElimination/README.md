# Process of elimination.
This reduces time for brute force searching by eliminating non candidates from selection.

## Dataset is in _data/user/candidates.txt
~~~ruby
value = File.read("_input/user/user_choice.txt").to_s.to_i

user_data   = File.readlines("_data/user/candidates.txt")
user_choice = user_data[value]
~~~

## AI needs is defined as a specified search. Specified search defines non candidates.
~~~ruby
ai_choice            = File.read("_data/ai/ai_choice.txt").to_s.to_i
ai_initial_candidate = user_data[ai_choice]
ai_search_limit      = user_data.size.to_i
~~~

## If specified search finds candidates, removes it, clones user dataset and creates own dataset in _data/ai/dataset.txt
~~~ruby
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
~~~

## Reframes its process using own dataset while keeping yours the same.
~~~ruby
ai_choice            = File.read("_data/ai/ai_choice.txt").to_s.to_i
ai_data              = File.readlines("_data/ai/candidates.txt")
ai_search_limit      = ai_data.size.to_i
ai_next_candidate    = ai_data[ai_choice]

ai_search_limit.times do
  if ai_next_candidate == user_choice
    ai_final_candidate = ai_next_candidate

    open("_posts/input.md", "w") { |f|
      f.puts ai_final_candidate
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
~~~

## Result can be located on http://localhost:8000/_feed/feed.xml
