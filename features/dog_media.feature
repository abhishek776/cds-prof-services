Feature:
  As a dogowner
  I should be able to add media (photos, videos) to my dog's profile
  So that other users can learn more about my dog.
  
Background:
  Given I am logged in as a new user
  And I own the following dogs:
    | name     | mix              | age | size            | gender | likes      | energy  | personality |
    | Princess | Labrador         | 1   | small (0-15)    | Female | cats       | High    | whatever    |
    | Spock    | Aidi             | 3   | medium (16-40)  | Male   | dogs (all) | Some    | lover       |


Scenario: Can upload additional photos
  When I edit "Princess"'s profile
  Then I should be able to upload additional photos

Scenario: See additional photos
  When I have added additional photos to "Princess"
  And I go to "Princess"'s dog page
  Then I should see an additional photos section
