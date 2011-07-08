class Interest  
  include Mongoid::Document  
  field :text, type: String
  
  
  def self.empty_text
    "Leave phone or email and we contact you"
    #"phone or email"
  end
    
end