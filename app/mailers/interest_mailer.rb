class InterestMailer < ActionMailer::Base
  default :from => "huxaptest@gmail.com"
  
  def notify_huxap(interest)
    to = "eddpeterson@gmail.com"
    subject = "Follwoing person showed interest in Huxap: #{interest.text}"
    mail(:to => to, :subject => subject).deliver
  end
end