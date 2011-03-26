Feature: User Administration
  As an administration
  I want to update user information.

  Scenario: Success modification of user data
  Given I am logged in as "Jane Doe" with email "doe@disney.com" having admin privileges
    When there exists a user "John Doe" with email "doe.a.dear@disney.com"
    And I follow "Users"
    And I want to change the "last name" for "doe.a.dear@disney.com" to "Dough"
    And I press "Update"
    Then I should see "Admin?"
    And I should see "John Dough"
    And the field "last name" for user "doe.a.dear@disney.com" should have a value of "Dough"

  Scenario: Failed to modify user data
  Given I am logged in as "Jane Doe" with email "doe@disney.com" having admin privileges
    When there exists a user "John Doe" with email "doe.a.dear@disney.com"
    And I follow "Users"
    And I want to change the "last name" for "doe.a.dear@disney.com" to ""
    And I press "Update"
    Then I should see "Last name can't be blank"