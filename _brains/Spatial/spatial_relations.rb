module SpatialRelationships
  class Error < StandardError; end

  class Static_Perimeters

    # The objects within the space.
    def positive_perimeters
      # Base radius of static objects.
      base_radius   = 2500
    
      # Specfic multipliers for Earth index based objects.
      base_two =  2   
      base_fro =  4
      base_six =  6
      base_eit =  8
  
      # Size of specific objects.
      size_of_planets    = base_radius ** base_fro
      size_of_moons      = base_radius ** base_two
      size_of_stars      = base_radius ** base_six
      size_of_blackholes = base_radius ** base_eit
    
      # Total output sizes of specific objects.
      puts "The size of the planets is #{size_of_planets} radius."; sleep(3)
      puts "The size of the moons is #{size_of_moons} radius."; sleep(3)
      puts "The size of the stars is #{size_of_stars} radius."; sleep(3)
      puts "The size of a blackhole is #{size_of_blackholes} radius."; sleep(3)
    end
  
    # Space between the objects.
    def negative_perimeters
      # Base distance between objects.
      base_distance = 1_000_000_000
  
      # Estimated divider between specific objects to base distance.
      space_between_planets    = 43.8
      space_between_moons      = 14.6
      space_between_stars      = 876
      space_between_blackholes = 2628
    
      # Minimum distance between objects.
      planet_distance    = base_distance / space_between_planets
      moon_distance      = base_distance / space_between_moons
      star_distance      = base_distance / space_between_stars
      blackhole_distance = base_distance / space_between_blackholes
    
      # Actual distance between objects
      actual_planets    = planet_distance * 10
      actual_moons      = moon_distance * 10
      actual_stars      = star_distance * 10
      actual_blackholes = blackhole_distance * 10
    
      # The output results of distance between objects.
      puts "The distance between planets is #{actual_planets} miles."; sleep(3)
      puts "The distance between moons is #{actual_moons} miles."; sleep(3)
      puts "The distance between stars is #{actual_stars} miles."; sleep(3)
      puts "The distance between blackholes is #{actual_blackholes} miles."; sleep(3)
    end
  
  end

  # Changing perimeters
  class Dynamic_Perimeters

    # The objects within the space.
    def positive_perimeters
      spaceship     = File.read("data/dynamic/positive_perimenters/spaceship_size.txt").strip.to_i
      space_station = spaceship * 200
      satalite      = space_station / 10
    
      puts "The total size of the space shuttle is #{spaceship} feet."; sleep(3)
      puts "The total size of the space station is #{space_station} feet."; sleep(3)
      puts "The total size of the satalite is #{satalite} feet."; sleep(3)
    end
  
    # Space between the objects.
    def negative_perimeters
      base_multiplier = 10
  
      # Minimum space between objects.
      space_between_spaceships = File.read("data/dynamic/negative_perimeters/space_between_spaceships.txt").strip.to_i
      space_between_station    = File.read("data/dynamic/negative_perimeters/space_between_station.txt").strip.to_i
      space_between_satalite   = File.read("data/dynamic/negative_perimeters/space_between_satalite.txt").strip.to_i
    
      # Actual space between objects
      actual_spaceship_distance = space_between_spaceships * base_multiplier
      actual_station_distance   = space_between_station * base_multiplier
      actual_satalite_distance  = space_between_satalite * base_multiplier
    
      puts "The minimum space between shuttles is #{actual_spaceship_distance} feet."; sleep(3)
      puts "The minimum space between stations is #{actual_station_distance} feet."; sleep(3)
      puts "The minimum space between satalites is #{actual_satalite_distance} feet."; sleep(3)
    end

  end
end
