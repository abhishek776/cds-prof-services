Feature:
  As a professional service provider
  I want to be able to create a professional service profile
  So that I can have access to the additional features available to professional services

Background:
  Given I am logged in as a new user

Scenario: See Payment page
  When I go to Clark's profile page
  And I follow "Create Professional Service"
  Then I should be redirected to a payment page
  
Scenario: Bay Payment
  When I go to Clark's profile page
  And I follow "Create Professional Service"
  And I enter false payment informaton
  And I press "Submit"
  Then I should see "Sorry, but those are invalid payment credentials"
  
Scenario: Pay for professional service
  When I go to Clark's profile page
  And I follow "Create Professional Service"
  And I enter my payment informaton
  And I press "Submit"
  Then I should see "Success"
  And I should see "Please enter your Service's Info"
