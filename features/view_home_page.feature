Feature: Users should be able to view a splash page with information
  
  As a prospective user
  In order to learn about the webstie and access signup/login functionalities
  I should be able to view the homepage
  
  Scenario: User is not logged in
    When I am on the home page
    Then I should see "CITY DOG SHARE"
    And I should see "FACEBOOK LOGIN"
