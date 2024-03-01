require "parslet"

module Cognitive
  class CognitiveParser < Parslet::Parser
    root(:cogseek)
    rule(:cogseek) { query }

    # Spacing
    rule(:space) { str(" ") }

    rule(:query) { language >> space >> script }

    # Header commands
    rule(:language)     { str("ruby") }

    # Scripts to execute.
    rule(:script)  { recipe | poetry | impchat }

    ## Specific script strings.
    rule(:recipe)  { str("|mspices|") }
    rule(:poetry)  { str("|mpoetry|") }
    rule(:impchat) { str("|mparler|") }
  end

  class CognitiveTransform < Parslet::Transform
    # space
    rule(:space) { " " }

    # Search rules
    rule(:language)     { "ruby" }
    
    # Script types
    rule(:recipe)       { "mix_spices" }
    rule(:poetry)       { "execute_script" }
    rule(:impchat)      { "IMPChat" }
  end

  class CognitiveML
    def self.decision_tree
      require "decisiontree"

      read_value = File.read("_input/interval.txt").to_s.to_i

      input = read_value

      attributes = ['Selector']

      training = [
        [  0.5, 'ruby |mspices|' ],
        [ 52.5, 'ruby |mpoetry|' ],
        [100.0, 'ruby |mparler|' ],
      ]

      # Instantiate the tree, and train it based on the data (set default to '1')
      dec_tree = DecisionTree::ID3Tree.new(attributes, training, 1, :continuous)
      dec_tree.train

      #print "What style? >> "; input + gets.chomp.to_f

      test     = [input]
      decision = dec_tree.predict(test)

      puts "Written the decision '#{decision}' to input file..."

      open("_pinput/input.txt", "w") { |f|
        f.puts decision
      }
    end
  end

  class CogExecute

    # Work in progress
    def self.haiku_algorithm
      require "naive_bayes"

      # Get the date.
      system("date > _date/date.txt")

      # Immutables
      date             = File.read("_date/date.txt").strip
      date_title       = date.tr " ", "_"

      a             = NaiveBayes.new(:haiku, :nonhaiku)
      # a.db_filepath = "_data/haiku_data.nb"

      haiku    = File.readlines("_input/haiku_list.txt")
      nothaiku = File.readlines("_input/nonhaiku_list.txt")

      # The size of each document.
      haiku_size     = haiku.size.to_i
      not_haiku_size = nothaiku.size.to_i

      # The interval set to zero for each training set.
      haiku_interval    = 0
      nothaiku_interval = 0

      # Train on what is haiku.
      haiku_size.times do
        a.train(:haiku, "#{haiku[haiku_interval]}", "word")

        haiku_interval = haiku_interval + 1
      end

      # Train on what isn't haiku.
      not_haiku_size.times do
        a.train(:nothaiku, "#{nothaiku[nothaiku_interval]}", "word")

        nothaiku_interval = nothaiku_interval + 1
      end

      # Classifying an action input.
      b = File.readlines("_input/haiku_set.txt")

      # Classifies the next line from this interval.
      line_interval = 0

      total_size = b.size.to_i

      open("_posts/input.md", "w") { |f|
        f.puts "## #{date_title}"

        total_size.times do
          read_line = b[interval].to_s.split(" ")

          f.print a.classify(read_line)
          f.puts " "

          interval = interval + 1
        end
      }
    end

    # Also a work in progress.
    def self.get_color
      require "naive_bayes"

      # Get the date.
      system("date > _date/date.txt")

      # Immutables
      date             = File.read("_date/date.txt").strip
      date_title       = date.tr " ", "_"

      a             = NaiveBayes.new(:color, :shade)
      # a.db_filepath = "_data/haiku_data.nb"

      color = File.readlines("_input/color_list.txt")
      shade = File.readlines("_input/shade_list.txt")

      # The size of each document.
      color_size = color.size.to_i
      shade_size = shade.size.to_i

      # The interval set to zero for each training set.
      color_interval = 0
      shade_interval = 0

      # Train on what is haiku.
      color_size.times do
        a.train(:color, "#{color[color_interval]}", "word")

        color_interval = color_interval + 1
      end

      # Train on what isn't haiku.
      shade_size.times do
        a.train(:shade, "#{shade[shade_interval]}", "word")

        shade_interval = shade_interval + 1
      end

      # Classifying an action input.
      b = File.readlines("_input/color_set.txt")

      # Classifies the next line from this interval.
      line_interval = 0

      total_size = b.size.to_i

      open("_posts/input.md", "w") { |f|
        f.puts "## #{date_title}"

        total_size.times do
          read_line = b[interval].to_s.split(" ")

          f.print a.classify(read_line)
          f.puts " "

          interval = interval + 1
        end
      }
    end

    def self.check_file
      begin
        input_file = File.read("_pinput/input.txt").to_s.split(" ")

        input = "#{input_file[0]} #{input_file[1]}"

        parser      = CognitiveParser.new
        transform   = CognitiveTransform.new

        tree        = parser.parse(input)
        ast         = transform.apply(tree)
        ast_output = "#{ast}".to_s

        search_query = "#{ast_output}"

        # puts search_query

        if    search_query == "ruby |mspices|"
          system("ruby mix_spices.rb")
        elsif search_query == "ruby |mpoetry|"
          system("ruby execute_script.rb")
        elsif search_query == "ruby |mparler|"
          system("ruby IMPChat.rb")
        end
      rescue Parslet::ParseFailed => error
        puts error.parse_failure_cause.ascii_tree
      end
    end

  end

end
