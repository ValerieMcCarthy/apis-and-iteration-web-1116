require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  films_array = []
  character_hash["results"].each do |char_array|
     if char_array["name"].downcase == character
      films_array = char_array["films"]
     #binding.pry
    end
  end
  films_array
end

def get_opening_crawl_from_api(movie_selected)

  all_movie = RestClient.get('http://swapi.co/api/films/')
  movie_hash = JSON.parse(all_movie)

  movie_hash["results"].each do |movie|
    if movie["title"].downcase == movie_selected
      return movie["opening_crawl"]
    end
  end
  "That is not a Star Wars movie!"
end

  
  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.


def get_film_info (films_array)
  #binding.pry
  if films_array == []
    puts "Your character was not found in Star Wars."
  else
    films_array.collect do |film|
      #binding.pry
      film_info = RestClient.get(film)
      film_hash = JSON.parse(film_info)
      film_hash["title"]
    end
  end
end

def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  puts get_film_info(films_hash)

end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
