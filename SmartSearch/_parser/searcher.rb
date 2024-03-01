require "parslet"

module SmartSearch
  class SearchParser < Parslet::Parser
    root(:expression)

    # Expression structure
    rule(:expression) { search }

    rule(:search)    { ask >> space >> datatype >> space >> ispresent }

    rule(:ask)       {        str("?") }
    rule(:space)     {        str(" ") }
    rule(:ispresent) { str("present?") }

    rule(:datatype) { image | text }

    rule(:image) { jpg | png | bmp }
    rule(:text)  { txt | odt | rtf }

    # Image Types
    rule(:jpg) { str("|jpg|") }
    rule(:png) { str("|png|") }
    rule(:bmp) { str("|bmp|") }

    # Text Types
    rule(:txt) { str("|txt|") }
    rule(:odt) { str("|odt|") }
    rule(:rtf) { str("|rtf|") }
  end

  class SearchTransform < Parslet::Transform
    # space
    rule(:space) { " " }

    # Search rules
    rule(:ask)       {          "ask" }
    rule(:ispresent) {     "present?" }

    # Filetypes
    rule(:jpg) { ".jpg" }
    rule(:png) { ".png" }
    rule(:bmp) { ".bmp" }
    rule(:txt) { ".txt" }
    rule(:odt) { ".odt" }
    rule(:rtf) { ".rtf" }
  end

  class SearchQuery
    def self.convert_query
      search_query = $search_query

      split_query = search_query.split(" ")

      file_type   = "#{split_query[1]}"

      convert_types = {
        "|jpg|" => ".jpg",
        "|png|" => ".png",
        "|bmp|" => ".bmp",
        "|txt|" => ".txt",
        "|odt|" => ".odt",
        "|rtf|" => ".rtf",
      }

      file_extension = convert_types[file_type]

      $file_to_read = "#{split_query[3]}#{file_extension}"
    end

    def self.is_present?
      file_to_read = $file_to_read

      if File.exist?(file_to_read)
        puts "This file exists in your directory."
      else
        puts "This file does not exist in your directory."
      end
    end
  end

  class ReadFile
    def self.check_file
      begin
        print "Search Command >> "; input = gets.chomp # .split(" ")
        print "Item           >> "; fname = gets.chomp

        parser      = SearchParser.new
        transform   = SearchTransform.new

        tree        = parser.parse(input)
        ast         = transform.apply(tree)
        ast_output = "#{ast}".to_s

        $search_query = "#{ast_output} #{fname}"

        SmartSearch::SearchQuery.convert_query
        SmartSearch::SearchQuery.is_present?
      rescue Parslet::ParseFailed => error
        puts error.parse_failure_cause.ascii_tree
      end
    end

    def self.multisearch
      begin
        read_file = File.readlines("_scripts/script.sen") #.to_s

        size_limit = read_file.size.to_i

        file_tokens = read_file #.strip

        number = 0
        fnumb  = 0

        size_limit.times do
          # Chooses a file from a file name and file number.
          fname_file = File.readlines("_filenames/files.txt")
          fname      = fname_file[fnumb]

          tokens = file_tokens[number].split(" ")

          input = "#{tokens[0]} #{tokens[1]} #{tokens[2]}" # gets.chomp # .split(" ")
          fname = "#{fname}"    # gets.chomp

          parser      = SearchParser.new
          transform   = SearchTransform.new

          tree        = parser.parse(input)
          ast         = transform.apply(tree)
          ast_output = "#{ast}".to_s

          $search_query = "#{ast_output} #{fname}"

          SmartSearch::SearchQuery.convert_query
          SmartSearch::SearchQuery.is_present?

          number = number + 1
          fnumb  = fnumb  + 1
        end
      rescue Parslet::ParseFailed => error
        puts error.parse_failure_cause.ascii_tree
      end
    end
  end
end
