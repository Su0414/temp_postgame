class Stories 
  
  attr_accessor :title, :description, :link
  
  @@all = []
  
  def initialize(args)
    @title = args[:story_title]
    @description = args[:story_description]
    @link = args[:story_link]
    
    @@all << self 
  end 
  
   def add_attributes_to_students(stories_array)
     stories_array.each do |story|
       self.new(story)
     end
  end
   
  
  def self.all 
    @@all 
  end 
  
end 