@facebook_test

Feature: Facebook OAuth is used for signing into accounts
  As a new City Dog Share user
  So that I can use City Dog Share
  I want to use my facebook account for authentication

  Background:
    Given I am on the home page
	
  Scenario: I should be able to sign up through facebook
    When I follow "FACEBOOK LOGIN"
    Then I should be on Clark's home feed
    
  Scenario: I should be able to log out from the home page
    When I follow "FACEBOOK LOGIN"
    And I am on the home page
    Then I should see "LOG OUT"
  
  Scenario: I should be able to log in after logging out
    When I follow "FACEBOOK LOGIN"
    And I am on the home page
    And I follow "LOG OUT"
    And I am on the home page
    And I follow "FACEBOOK LOGIN"
    Then I should be on Clark's home feed
