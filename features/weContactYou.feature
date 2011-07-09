Feature: We contact you 
  In order to contact me
  As a website visitor
  I want to be able to fill in my contact information so that you can contact me shortly after

  Scenario: Add my email from the home page
    Given I am on the home page 
    When I fill in "interest_text" with "myemail@gmail.com"
	And I press "Contact me"
    Then I should see "Thanks, we contact you shortly!"
   
  



  
