class InterestsController < ApplicationController
  respond_to :html
  
  def new
    @interest = Interest.new
    respond_with(@interest)
  end
  
  def create
    @interest = Interest.new(params[:interest])
    respond_to do |format|
      @notice = "";
      puts "isssssssssssssssssssss valid: #{is_valid?(@interest)}"
      if is_valid?(@interest) and @interest.save
        InterestMailer.notify_huxap(@interest)
        @notice = "Thanks, we contact you shortly!"
        #format.html { redirect_to(@interest, :notice => 'Thanks, we contact you shortly!') }
        #redirect_to :back        
      end
      format.html { redirect_to :back, :notice => @notice }
    end
  end
  
  def is_valid? interest
    interest.text != Interest.empty_text
  end  
end