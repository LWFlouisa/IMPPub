require "parslet"

module IMPUnit
  # Natural Language Method
  class BrainsParser < Parslet::Parser
    root(:expression)

    # Grammar components
    rule(:space)      { str(" ") }

    ## Essentials
    rule(:take)       {       str("Take") }
    rule(:me)         {         str("me") }
    rule(:to)         {         str("to") }
    rule(:analyzer)   {   str("analyzer") }
    rule(:statistics) { str("statistics") }
    rule(:language)   {   str("language") }
    rule(:adaptor)    {    str("adaptor") }
    rule(:profile)    {    str("profile") }
    rule(:period)     {          str(".") }
    rule(:search)     {     str("search") }

    # Telnet
    rule(:telnet)     {     str("Telnet") }
    rule(:mapscii)    {    str("mapscii") }
    rule(:weather)    {    str("weather") }

    # What is an expression.
    rule(:expression) { language | decision | search | mix_spices | telnet_expression }

    # Expression Rule Types
    rule(:language)      { analyses | statistics | syllabic_drift }

    # Language Rules
    rule(:analyses)       { take >> space >> space >> me >> space >> to >> space >> analyzer                       >> period }
    rule(:statistics)     { take >> space >> space >> me >> space >> to >> space >> statistics >> space >> profile >> period }
    rule(:syllabic_drift) { take >> space >> space >> me >> space >> to >> space >> language   >> space >> adapter >> period }

    # Decision making rules
    rule(:decision) { fashion | image_text }

    ## Command for fashion.
    rule(:fashion) { take >> space >> me >> space >> to >> space >> fashion >> period }

    ## Command for image text.
    rule(:image_text) { take >> space >> me >> to >> pictures >> period }

    # Types of searches and their methods.
    rule(:simple_search) { take >> space >> me >> to >> search >> period }

    # Types of spice mixes and with our without heat detector.
    rule(:mix_spices)    { take >> space >> me >> space >> to >> space >> spices }

    # Telenet specific expressions
    rule(:telnet_expression) { telnet_mapscii | telnet_weather }

    ## Structure of specific telnet phrases
    rule
  end

  class BrainsTransform < Parslet::Transform
    ## Space between tokens
    rule(:space)      {          " " } # This just determines where to split the query.

    ## Header
    rule(:take)       {       "take" }
    rule(:me)         {         "me" }
    rule(:to)         {         "to" }

    # These determine where type of command is recieved.
    rule(:analyzer)   {   "analyzer" }
    rule(:statistcs)  { "statistics" }
    rule(:language)   {   "language" }
    rule(:adaptor)    {    "adaptor" }
    rule(:profile)    {    "profile" }
    rule(:period)     {          "." }
  end

  class BrainsCommands
    # Method of converting natural language to baysian token.
    def self.analyze_language
      def self.adaptation # Language Adaptor
        system("ruby _brains/Language/Adaptation/linguadapt.rb")

        # Exits the script.
        abort
      end

      def self.statistical # Statistical language analyses.
        system("ruby _brains/Language/Statistics/get_frequency.rb")

        # Exits the script.
        abort
      end

      def self.syllabic_drift # Predict the syllabic drift of loan words.
        system("ruby _brains/Language/SyllabicDrift/predict_drift.rb")

        # Exits the script.
        abort
      end
    end

    # Method of converting natural language to decisions the bot can make.
    def self.make_decision
      system("ruby _brains/DecisionMaking/make_decision.rb")

      # Exits the script
      abort
    end

    # Method of converting natural language to specific instructions.
    def self.simple_search
      system("ruby mix_spices.rb")

      # Exits the script
      abort
    end

    def self.mix_spices
      system("ruby mix_spices.rb")

      # Exits the script
      abort
    end

    def self.write_poetry
      system("ruby publish.rb")

      # Exits the script
      abort
    end

    def self.get_input
      begin
      rescue Parslet::ParseFailed => error
        puts error.parse_failure_cause.ascii_tree
      end
    end
  end
end
