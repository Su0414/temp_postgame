

require_relative "scraper.rb"
require_relative "sports.rb"


require 'nokogiri'
require 'colorize'

class TempPostgame::CLI
  
  BASE_PATH = "http://www.thepostgame.com/tag/nfl"
  
  def call 
    puts "Welcome to temp Postgame"
    menu
    make_sports_menu
    add_attributes_to_stories
    display_stories
  end 
  
    def menu 
      puts "Read latest stories about sports you like.....................
            Enter any number between [1-9] 
            OR 
            type list sports - to display sports names - you want to read stories about 
            OR
            type exit"
            
    
    end 
  
    def make_sports_menu 
      sports_array = Scraper.scrape_menu(BASE_PATH)
      Sports.create_from_collection(sports_array)
    end
    
    def add_attributes_to_stories
       stories_array = Scraper.scrape_stories_details(BASE_PATH)
       
       stories_array.each do |story|
          Sports.create_from_collection_stories(story)
       end
    end 
    
    def display_stories 
      
      
    end

  
end 