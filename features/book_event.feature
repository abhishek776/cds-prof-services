Feature: confirm event booking for your dog
  As a dogowner
  I should be able to view everyone who wants to book my dog's event 
  So that I can confirm a booking with someone I approve of.

Background: user has been added to the database and logged in
  Given the following users exist:
    | last_name  | first_name | gender | image                      | phone_number  | description  | address       | zipcode | city     | country | uid |
    | Kent       | Clark      | male   | http://tinyurl.com/opnc38n | (555)228-6261 | I love bats  | 387 Soda Hall | 94720   | Berkeley | US      | 5   |
    | Pinzon     | Juan       | male   | http://tinyurl.com/okrw3vd | (555)123-1234 |   love dogs  | 387 Cory Hall | 94720   | Berkeley | US      | 6   |
  
  And the following dogs exist:
    | name          | gender | age | energy | size            | personality     | mix                   |
    | Batman        | Male   | 3   | High   | large (41-100)  | still a puppy   | German Shepherd Dog   |
    | The Joker     | Male   | 6   | Active | medium (16-40)  | fetcher         | Mutt                  |
    | Harley Quinn  | Female | 4   | Some   | small (0-15)    | lover           | Poodle                |
  
  And I am on the home page
  And "Bruce Wayne" has requested an event for "The Joker"

Scenario: I can see the event request
  Then I should see "Bruce Wayne"
  And I should see "The Joker"

Scenario: I can confirm the event booking
  When I follow "Confirm Event"
  Then I should see "(555)555-5555"
  And Bruce Wayne should see my phone number