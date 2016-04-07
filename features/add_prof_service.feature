Feature:
  As a professional service provider
  I want to be able to create a professional service profile
  So that I can have access to the additional features available to professional services

Background:
  Given I am logged in as a new user

Scenario: Can create a professional service
  When I go to Clark's profile page
  Then I should see "Create Professional Service"

Scenario: Cannot convert other user to professional service
  When I go to Bruce's profile page
  Then I should not see "Create Professional Service"

Scenario: Create professional service
  When I go to Clark's profile page
  And I follow "Create Professional Service"
  And I fill in "Company Name" with "Wayne Enterprises"
  And I fill in "Description" with "Weapons for all your possible needs"
  And I press "Submit"
  Then there should exist a professional service called "Wayne Enterprises"
  And I should be a owner of "Wayne Enterprises"
