class Interest  
  include Mongoid::Document  
  field :text, type: String
  
  
  def self.empty_text
    "Leave phone or email, we contact you"
  end
    
end