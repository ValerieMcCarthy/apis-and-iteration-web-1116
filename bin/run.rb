#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
user_selection = selection
if user_selection == "character"
	character = get_character_from_user
	show_character_movies(character)
else

	movie_selected = get_movie_from_user
	puts get_opening_crawl_from_api(movie_selected)

end