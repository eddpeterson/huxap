require 'spec_helper'

describe Interest do
  context "Save model" do
    
    it "with valid email" do
      interest = Interest.new
      interest.text = "myemail@gmail.com"
      interest.save.should be true
    end
    
  end
end