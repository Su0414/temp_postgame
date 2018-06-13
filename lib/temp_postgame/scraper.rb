require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper 
  
   def self.scrape_menu(sports_url) 
     sports = ["NFL", "NBA", "NHL","SOCCER", "TENNIS", "OLYMPICS", "GOLF", "BOXING", "WRESTLING", "HORSE RACING"]
     
      doc = Nokogiri::HTML(open(sports_url))
      
      # sports = doc.css('nav.menu ul li a')
      # sports.attribute("href").text
      
      
      sports_args = Array.new
      doc.css('nav.menu ul li a').each do |sport|
        
        sports_name = sport.attribute("href").text.split("/").last.upcase
        
        if sports.include? sports_name
          sports_args << {
            :sports_name => sports_name,
            :sports_url => sport.attribute("href").text
          }
        end
      end
      sports_args
  end
  
  
  def self.scrape_stories_details(sports_url) 
    
    doc = Nokogiri::HTML(open(sports_url))
    stories_args = Array.new
      doc.css('div.item-list ul li').each do |story|
        
          stories_args << {
            :story_title => story.css("h2").text,
            :story_description => story.css("p").text,
            :story_link => story.css("span").text
          }
      end
      puts stories_args
    stories_args
  end 
  
end 

# Scraper.scrape_stories_details("http://www.thepostgame.com/tag/nfl")

