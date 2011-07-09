require 'spec_helper'

describe InterestsController do
  def do_create interest
    @request.env['HTTP_REFERER'] = 'http://localhost' # otherwise you get error: No HTTP_REFERER was set in the request to this action, so redirect_to :back could not be called successfully. If this is a test, make sure to specify request.env["HTTP_REFERER"].
    post :create, interest
  end
  
  context "Add new interested contact" do
    @interest_text = "jack.welch@ge.com"
    before(:each) do
      Interest.stub!(:new).and_return(@interest = mock_model(Interest, :save=>true, :text => @interest_text))
      InterestMailer.stub!(:notify_huxap)
    end    
    
    it "should recieve interest text from post" do
      Interest.should_receive(:new).with("text"=>"suzy@ge.com")
      do_create :interest => {:text=>"suzy@ge.com"}
    end 
    it "should save model when text is passed" do
      @interest.should_receive(:save).and_return(true)
      InterestsController.stub!(:is_valid?).with(any_args()).and_return(true)
      do_create :interest => {:text=>"greg@ge.com"}
    end 
  end
  

  
  context "Send email to notify Huxap" do
    it "send's email notification" do
      Interest.stub!(:new).and_return(@interest = mock_model(Interest, :save=>true, :text => "Jack.Welch@ge.com"))
      InterestsController.stub!(:is_valid?).with(any_args()).and_return(true)
      InterestMailer.should_receive(:notify_huxap).with(@interest)
      do_create :interest => {:text=>"Jack.Welch@ge.com"}
    end
  end
  
  
  
end
