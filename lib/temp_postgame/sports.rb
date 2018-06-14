class Sports
  
  
  @@all = []
  
  attr_accessor :name, :sport_url, :stories
  
  
  def initialize(args)
    @name = args[:name]
    @sport_url = args[:sport_url]
    @stories = []
    
    @@all << self 
  end 
  
  def self.create_from_collection(sports_array)
    sports_array.each do |sport|
       self.new(sport)
    end
  end
   
  
  def self.all 
    @@all 
  end 
  
end 
