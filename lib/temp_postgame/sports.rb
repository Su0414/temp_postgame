class Sports
  
  
  @@all = []
  
  attr_accessor :name, :sport_url, :title, :description, :link ,:stories
  
  
  def initialize(args)
    @name = args[:name]
    @sport_url = args[:sport_url]
    @stories = Array.new
    @@all << self 
  end 
  
  def self.create_from_collection(sports_array)
    sports_array.each do |sport|
       self.new(sport)
    end
  end
   
  def self.create_from_collection_stories(story)
     @title = story[:story_titile]
     @description = story[:story_description]
     @link = story[:story_link]
  end
  
  def self.all 
    @@all 
  end 
  
end 
