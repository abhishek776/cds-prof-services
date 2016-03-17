Feature: Create event for your dog
  As a user who owns dogs
  I should be able to create events for my dog
  In order to request people to sit or walk my dog
  
Backgound:
  Given that I am logged in to my account
  And I own the following two dogs:
    
  | name          | gender | age | energy | size            | personality     | mix                             |
  | Batman        | Male   | 3   | High   | large (41-100)  | still a puppy   | German Shepherd Dog             |
  | The Joker     | Male   | 6   | Active | medium (16-40)  | fetcher         | Mutt                            |          |
  
  
Scenario: I should be able to create an event to sit my dog
  When I create a "dog sitting" event for "Batman"
  And I am on "Batman"'s dog page
  Then I should see a "dog sitting" event on "Batman"'s event list
 
Scenario: I should be able to create an event to walk my dog
  When I create a "dog walking" event for "The Joker"
  And I am on "The Joker's" dog page
  Then I should see a "dog walking" event on "The Joker"'s event list
