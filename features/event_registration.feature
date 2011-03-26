Feature: Event registration
  As a visitor
  I want to register for an event

  Scenario: Successful registration without credit card
    Given a "owl prowl" event exists
    When I go to the homepage
    And I follow "Upcoming events"
    And show me the page
    And I follow "owl prowl"
    And I fill in "first_name" with "Derek"
    And I fill in "last_name" with "Kastner"
    And I fill in "email" with "derek@kastner.com"
    And I fill in "address" with "123 Main St"
    And I fill in "city" with "Lansing"
    And I select "Michigan" from "state"
    And I fill in "zip_code" with "48915"
    And I follow "Register"
    Then I should see "success"

  Scenario: Successful registration with credit card
    Given a "owl prowl" event exists
    When I go to the homepage
    And I follow "Upcoming events"
    And I follow "owl prowl"
    And I fill in "first_name" with "Derek"
    And I fill in "last_name" with "Kastner"
    And I fill in "address" with "123 Main St"
    And I fill in "city" with "Lansing"
    And I select "Michigan" from "state"
    And I fill in "zip_code" with "48915"
    And I fill in "cc_number" with "4111111111111111"
    And I select "July" from "cc_expiration_month"
    And I select "2013" from "cc_expiration_year"
    And I fill in "cc_ccv" with "123"
    And I follow "Register"
    Then I should see "success"

  Scenario: Successful registration as a member with credit card
    Given a "owl prowl" event exists
    And a member with email "derek@kastner.com" and password "secret" exists
    When I go to the homepage
    And I follow "Upcoming events"
    And I follow "owl prowl"
    And I follow "log in"
    And I fill in "email" with "derek@kastner.com"
    And I fill in "password" with "secret"
    And I press "Log in"
    And I follow "Register"
    Then I should see "success"

  Scenario: Successful registration as a member with credit card
    Given a "owl prowl" event exists
    And a member with email "derek@kastner.com" and password "secret" exists
    When I go to the homepage
    And I follow "Upcoming events"
    And I follow "owl prowl"
    And I follow "log in"
    And I fill in "email" with "derek@kastner.com"
    And I fill in "password" with "secret"
    And I press "Log in"
    And I fill in "cc_number" with "4111111111111111"
    And I select "July" from "cc_expiration_month"
    And I select "2013" from "cc_expiration_year"
    And I fill in "cc_ccv" with "123"
    And I follow "Register"
    Then I should see "success"
