require 'spec_helper'

describe InterestsController do
  context "Add new interested contact and notify huxap" do
    
    before(:each) do
      Interest.stub!(:new).and_return(@interest = mock_model(Interest, :save=>true))
    end    
    def do_create interest
      @request.env['HTTP_REFERER'] = 'http://localhost' # otherwise you get error: No HTTP_REFERER was set in the request to this action, so redirect_to :back could not be called successfully. If this is a test, make sure to specify request.env["HTTP_REFERER"].
      post :create, interest
    end
      
    it "gets model" do
      Interest.should_receive(:new).with("text"=>"Jack.Welch@ge.com").and_return(@interest)
      do_create :interest => {:text=>"Jack.Welch@ge.com"}
    end 
    it "saves model" do
      @interest.should_receive(:save).and_return(true)
      do_create :interest => {:text=>"Jack.Welch@ge.com"}
    end 
    
    it "send's email notification" 
    
  end
end