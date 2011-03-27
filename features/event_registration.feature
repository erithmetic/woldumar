Feature: Event registration
  As a visitor
  I want to register for an event

  Scenario: Successful registration without credit card
    Given a "owl prowl" event exists
    When I go to the homepage
    And I follow "Upcoming Events"
    And I follow "Register for owl prowl"
    And I fill in "first_name" with "Derek"
    And I fill in "last_name" with "Kastner"
    And I fill in "email" with "derek@kastner.com"
    And I fill in "address_line_1" with "123 Main St"
    And I fill in "city" with "Lansing"
    And I select "Michigan" from "user_state"
    And I fill in "postal_code" with "48915"
    And I press "Register"
    Then I should see "You are registered"

  Scenario: Successful registration with credit card
    Given a "owl prowl" event exists
    When I go to the homepage
    And I follow "Upcoming Events"
    And I follow "Register for owl prowl"
    And I fill in "first_name" with "Derek"
    And I fill in "last_name" with "Kastner"
    And I fill in "address_line_1" with "123 Main St"
    And I fill in "city" with "Lansing"
    And I select "Michigan" from "user_state"
    And I fill in "postal_code" with "48915"
    And I fill in "credit_card_number" with "4111111111111111"
    And I select "July" from "credit_card_expiration_month"
    And I select "2013" from "credit_card_expiration_year"
    And I fill in "credit_card_ccv" with "123"
    And I press "Register"
    Then I should see "You are registered"

  Scenario: Successful registration as a member with credit card
    Given a "owl prowl" event exists
    And a member with email "derek@kastner.com" and password "secret" exists
    When I go to the homepage
    And I follow "Upcoming Events"
    And I follow "Register for owl prowl"
    And I follow "log in"
    And I fill in "user_email" with "derek@kastner.com"
    And I fill in "user_password" with "secret"
    And I press "Sign in"
    And I press "Register"
    Then I should see "You are registered"

  Scenario: Successful registration as a member with credit card
    Given a "owl prowl" event exists
    And a member with email "derek@kastner.com" and password "secret" exists
    When I go to the homepage
    And I follow "Upcoming Events"
    And I follow "Register for owl prowl"
    And I follow "log in"
    And I fill in "user_email" with "derek@kastner.com"
    And I fill in "user_password" with "secret"
    And I press "Sign in"
    And I fill in "credit_card_number" with "4111111111111111"
    And I select "July" from "credit_card_expiration_month"
    And I select "2013" from "credit_card_expiration_year"
    And I fill in "credit_card_ccv" with "123"
    And I press "Register"
    Then I should see "You are registered"

  Scenario: New user missing required fields
    Given a "owl prowl" event exists
    When I go to the homepage
    And I follow "Upcoming Events"
    And I follow "Register for owl prowl"
    And I fill in "first_name" with "Derek"
    And I fill in "last_name" with "Kastner"
    And I fill in "address_line_1" with "123 Main St"
    And I fill in "city" with "Lansing"
    And I select "Michigan" from "user_state"
    And I fill in "postal_code" with "48915"
    And I press "Register"
    Then I should see "error"
