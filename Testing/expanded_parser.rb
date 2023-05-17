require "parslet"
require "naive_bayes"

module Ahusacos
  class AhusacosParser < Parslet::Parser
    root(:phrase_index)

    ## Punctuation
    rule(:space) { str(" ") }

    ### Further punctuation rules.
    rule(:punctuation)   { question_mark | full_stop }
    rule(:question_mark) { str("?") }
    rule(:full_stop)     { str(".") }

    ## English tokens
    rule(:en_gender)      { str("The") }
    rule(:en_noun)        {}
    rule(:en_adjective)   {}
    rule(:en_preposition) {}
    rule(:en_verb)        {}
    rule(:en_adverb)      {}

    ## French tokens
    rule(:fr_gender)      {     le |    la |   les } 

    ### Fr Noun Specific
    rule(:fr_noun)        { person | place | thing }

    rule(:person) { man | woman | boy | girl }

    rule(:man)   {  str("homme") }
    rule(:woman) {  str("femme") }
    rule(:boy)   { str("garcon") }
    rule(:girl)  {  str("fille") }

    rule(:place)  {     fr_indoors | fr_outdoors   }

    #### French Indoor Rules
    rule(:fr_indoors)  { fr_bedroom       | fr_bedroom_hallway | fr_hallway_bathroom |
                         fr_kitchen       | fr_sunroom         | fr_living_room      |
                         fr_garage        | fr_cavern          | fr_gas_station      |
                         fr_sch_hall      | fr_lockerroom      | fr_gymnasium        |
                         fr_classroom     | fr_cafeteria       | fr_princ_office     |
                         fr_grocery_in    | fr_police_station  | fr_schoool_theater  |
                         fr_bowling_alley | fr_movie_theater   | fr_bongshop         |
                         fr_dancing_club  | fr_restaurant      | fr_fast_food_inside |
                         fr_minimart                                                   }

    ##### Final Break down of interior rules in Francais.
    rule(:fr_bedroom)          { str("chambre-a-coucher") }
    rule(:fr_bedroom_hallway)  {}
    rule(:fr_kitchen)          {}
    rule(:fr_sunroom)          {}
    rule(:fr_living_room)      {}
    rule(:fr_garage)           {}
    rule(:fr_cavern)           {}
    rule(:fr_gas_station)      {}
    rule(:fr_sch_hall)         {}
    rule(:fr_lockerroom)       {}
    rule(:fr_gymnasium)        {}
    rule(:fr_classroom)        {}
    rule(:fr_cafeteria)        {}
    rule(:fr_princ_office)     {}
    rule(:fr_grocery_in)       {}
    rule(:fr_police_station)   {}
    rule(:fr_school_theater)   {}
    rule(:fr_bowling_alley)    {}
    rule(:fr_movie_theater)    {}
    rule(:fr_bongshop)         {}
    rule(:fr_dancing_club)     {}
    rule(:fr_restaurant)       {}
    rule(:fr_fast_food_inside) {}
    rule(:fr_minimart)         {}

    #### French Outdoor Rules
    rule(:fr_outdoors) {}

    rule(:thing)  {        pets | objects    }

    ### Fr Adjective Specific
    rule(:fr_adjective)   {}

    ### Fr Preposition Specific
    rule(:fr_preposition) {}

    ### Fr Verb Specific
    rule(:fr_verb)        {}

    ### Fr Adverb Specific
    rule(:fr_adverb)      {}

    ## Japanese tokens
    rule(:jp_gender)      {}
    rule(:jp_noun)        {}
    rule(:jp_adjective)   {}
    rule(:jp_preposition) {}
    rule(:jp_verb)        {}
    rule(:jp_adverb)      {}

    ## German tokens
    rule(:gm_gender)      {}
    rule(:gm_noun)        {}
    rule(:gm_adjective)   {}
    rule(:gm_preposition) {}
    rule(:gm_verb)        {}
    rule(:gm_adverb)      {}

    ## Hybrid tokens
    rule(:hb_gender)      {}
    rule(:hb_noun)        {}
    rule(:hb_adjective)   {}
    rule(:hb_preposition) {}
    rule(:hb_verb)        {}
    rule(:hb_adverb)      {}

    rule(:phrase_index) { en_phrase | fr_phrase | jp_phrase | gn_phrase | hb_phrase }

    rule(:en_phrase) { en_gender >> space >> en_noun >> space >> en_adjective >> space >> en_preposition >> space >> en_verb >> space >> en_adverb >> punctuation }
    rule(:fr_phrase) { fr_gender >> space >> fr_noun >> space >> fr_adjective >> space >> fr_preposition >> space >> fr_verb >> space >> fr_adverb >> punctuation }
    rule(:jp_phrase) { jp_gender >> space >> jp_noun >> space >> jp_adjective >> space >> jp_preposition >> space >> jp_verb >> space >> jp_adverb >> punctuation }
    rule(:jp_phrase) { gm_gender >> space >> gm_noun >> space >> gm_adjective >> space >> gm_preposition >> space >> gm_verb >> space >> gm_adverb >> punctuation }

    # Creole structure
    rule(:hb_phrase) { hb_gender >> space >> hb_noun >> space >> hb_adjective >> space >> hb_preposition >> space >> hb_verb >> space >> hb_adverb >> punctuation }
  end

  class AhusacosTransform < Parslet::Transform
  end

  class AhusacosBaysian
    def self.track_tokens
    end
  end
end