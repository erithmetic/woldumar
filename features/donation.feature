Feature: Donation
  As a visitor
  I want to donate to Woldumar
  So that I can write it off on my taxes

  Scenario: Successful donation without credit card
    When I go to the homepage
    And I follow "Donations"
    And I fill in "donation_in_memory_of" with "Kenny"
    And I fill in "first_name" with "Derek"
    And I fill in "last_name" with "Kastner"
    And I fill in "email" with "derek@kastner.com"
    And I fill in "address_line_1" with "123 Main St"
    And I fill in "city" with "Lansing"
    And I select "Michigan" from "user_state"
    And I fill in "postal_code" with "48915"
    And I fill in "donation_amount" with "135.23"
    And I press "Donate"
    Then I should see "Thank you for your donation"

  Scenario: Successful donation with credit card
    Given my credit card is valid
    When I go to the homepage
    And I follow "Donations"
    And I fill in "donation_in_memory_of" with "Kenny"
    And I fill in "first_name" with "Derek"
    And I fill in "last_name" with "Kastner"
    And I fill in "email" with "derek@kastner.com"
    And I fill in "address_line_1" with "123 Main St"
    And I fill in "city" with "Lansing"
    And I select "Michigan" from "user_state"
    And I fill in "postal_code" with "48915"
    And I fill in "credit_card_number" with "4111111111111111"
    And I select "July" from "credit_card_expiration_month"
    And I select "2013" from "credit_card_expiration_year"
    And I fill in "credit_card_ccv" with "123"
    And I fill in "donation_amount" with "135.23"
    And I press "Donate"
    Then I should see "Thank you for your donation"

  Scenario: Successful donation as a member without credit card
    Given a member with email "derek@kastner.com" and password "secret" exists
    When I go to the homepage
    And I follow "Donations"
    And I follow "log in"
    And I fill in "user_email" with "derek@kastner.com"
    And I fill in "user_password" with "secret"
    And I press "Sign in"
    And I fill in "donation_in_memory_of" with "Kenny"
    And I fill in "donation_amount" with "135.23"
    And I press "Donate"
    Then I should see "Thank you for your donation"

  Scenario: Successful donation as a member with credit card
    Given a member with email "derek@kastner.com" and password "secret" exists
    And my credit card is valid
    When I go to the homepage
    And I follow "Donations"
    And I follow "log in"
    And I fill in "user_email" with "derek@kastner.com"
    And I fill in "user_password" with "secret"
    And I press "Sign in"
    And I fill in "credit_card_number" with "4111111111111111"
    And I select "July" from "credit_card_expiration_month"
    And I select "2013" from "credit_card_expiration_year"
    And I fill in "credit_card_ccv" with "123"
    And I fill in "donation_amount" with "135.23"
    And I press "Donate"
    Then I should see "Thank you for your donation"

  Scenario: New user missing required fields
    When I go to the homepage
    And I follow "Donations"
    And I fill in "first_name" with "Derek"
    And I fill in "last_name" with "Kastner"
    And I fill in "address_line_1" with "123 Main St"
    And I fill in "city" with "Lansing"
    And I select "Michigan" from "user_state"
    And I fill in "postal_code" with "48915"
    And I fill in "donation_amount" with "135.23"
    And I press "Donate"
    Then I should see "error"

  Scenario: Invalid credit card
    Given my credit card is invalid
    When I go to the homepage
    And I follow "Donations"
    And I fill in "first_name" with "Derek"
    And I fill in "last_name" with "Kastner"
    And I fill in "address_line_1" with "123 Main St"
    And I fill in "city" with "Lansing"
    And I select "Michigan" from "user_state"
    And I fill in "postal_code" with "48915"
    And I fill in "donation_amount" with "135.23"
    And I press "Donate"
    Then I should see "error"
