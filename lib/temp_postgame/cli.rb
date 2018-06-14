

require_relative "scraper.rb"
require_relative "sports.rb"

require 'nokogiri'
require 'colorize'



class TempPostgame::CLI
  BASE_PATH = "http://www.thepostgame.com/tag/nfl"
  def call 
    puts "Welcome to temp Postgame"
    
    make_sports_menu
    add_attributes_to_stories
    display_students
    
  end 
  
    def make_sports_menu 
      sports_array = Scraper.scrape_menu(BASE_PATH)
      Sports.create_from_collection(sports_array)
    end
    
    def display_students 
    end

  
end 