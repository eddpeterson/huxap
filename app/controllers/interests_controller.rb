class InterestsController < ApplicationController
  respond_to :html
  
  def new
    @interest = Interest.new
    respond_with(@interest)
  end
  
  def create
    @interest = Interest.new(params[:interest])
    respond_to do |format|
      if @interest.save
        InterestMailer.notify_huxap(@interest)
        format.html { redirect_to :back, :notice => 'Thanks, we contact you shortly!' }
        #format.html { redirect_to(@interest, :notice => 'Thanks, we contact you shortly!') }
        #redirect_to :back
      else
        format.html { render :action => "new" }
      end
    end
  end

end