@facebook_test
Feature: Users should be able to edit their profile.

As a user
In order to change my information
I want to edit my profile

Background: User and other users are in database
  Given the following users exist:
    | last_name  | first_name | location              | gender | image                      | status  | phone_number  | email                           | description  | availability   | address       | zipcode | city     | country |
    | Wayne      | Bruce      | Bat Cave, Gotham City | male   | http://tinyurl.com/opnc38n | looking | (555)228-6261 | not_batman@wayneenterprises.com | I love bats  | not nights     | 387 Soda Hall | 94720   | Berkeley | US      |

  And I am logged in
  And I am on the Clark's profile page
  
# Scenario: Page shows flash notice when user tries to edit another profile
#   When I am on the edit page for non-existent user
#   Then I should see "You may only edit your own profile."

Scenario: Edit user profile
  When I follow "Edit Profile"
  When I fill in "user_phone_number" with "213-234-8888"
  And I fill in "user_zipcode" with "94704"
  And I fill in "user_address" with "2222 Blake str, apt 333"
  And I fill in "user_city" with "Berkeley"
  And I fill in "user_description" with "I think I should make City Cat Share."
  And I press "Save Changes"
  Then I should be on the Clark's profile page
  And I should see "2222 Blake str, apt 333"
  And I should see "94704"

  When I follow "Edit Profile"
  When I fill in "user_address" with "2128 Oxford St"
  And I fill in "user_city" with "Berkeley"
  And I fill in "user_zipcode" with "90000"
  And I fill in "user_country" with "US"
  And I fill in "user_phone_number" with "(510)123-1234"
  And I fill in "user_description" with "I think I should make City Bat Share."
  And I press "Cancel Changes"
  Then I should be on the Clark's profile page
  And I should see "2222 Blake str, apt 333"
  And I should see "94704"