def welcome
  puts "Hi, welcome to the world of Star Wars."
end

def selection
  puts "What would you like to search for: character or movie?"
  choice = gets.chomp.downcase
end


def get_character_from_user
  puts "please enter a character"
  # use gets to capture the user's input. This method should return that input, downcased.
  user_input = gets.chomp.downcase
end

def get_movie_from_user
	puts "please enter a movie"
	user_input = gets.chomp.downcase
end
