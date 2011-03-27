Feature: User Administration
  As an administration
  I want to update user information.

  Scenario: Successful modification of user data
  Given I am logged in as "Jane Doe" with email "doe@disney.com" having admin privileges
    When there exists a user "John Doe" with email "doe.a.dear@disney.com"
    And I follow "Users"
    And I want to change the "last name" for user "doe.a.dear@disney.com" to "Dough"
    And I press "Update"
    Then I should see "Admin?"
    And I should see "John Dough"
    And the field "last name" for user "doe.a.dear@disney.com" should have a value of "Dough"

  Scenario: Failed to modify user data
  Given I am logged in as "Jane Doe" with email "doe@disney.com" having admin privileges
    When there exists a user "John Doe" with email "doe.a.dear@disney.com"
    And I follow "Users"
    And I want to change the "last name" for user "doe.a.dear@disney.com" to ""
    And I press "Update"
    Then I should see "Last name can't be blank"

  Scenario: Successful new event submission
  Given I am logged in as "Jane Doe" with email "doe@disney.com" having both privileges
    When I follow "Events"
    And I follow "New Event"
    And I fill in "event_name" with "New Test Event"
    And I fill in "event_description" with "Cucumber testing event"
    And I fill in "event_details" with "This event will be blown away after the test is complete."
    And I fill in "event_start_date" with "12/10/2011 11:00:00am"
    And I fill in "event_end_date" with "12/11/2011 1:00:00pm"
    And I press "Create Event"
    Then I should see "New Test Event"
    And I should see "Cucumber testing event"
    And I should not see "This event will be blown away"
    And I should see "2011-12-10 11:00:00"
    And I should see "2011-12-11 13:00:00"

  Scenario: Successful event update submission
    Given I am logged in as "Jane Doe" with email "doe@disney.com" having admin privileges
      When there exists an event "Update Event" starting on "10/12/2000"
      And I follow "Events"
      And I want to change the "description" for event "Update Event" to "I've been updated"
      And I press "Update Event"
      Then I should see "I've been updated"
      And I should see "2000-10-12 12:00:00"

  Scenario: Successful new camp submission
    Given I am logged in as "Jane Doe" with email "doe@disney.com" having both privileges
      When I follow "admin_camps"
      And I follow "New Camp"
      And I fill in "camp_name" with "New Test Camp"
      And I fill in "camp_min_age" with "10"
      And I fill in "camp_max_age" with "15"
      And I fill in "camp_details" with "This camp will be blown away after the test is complete."
      And I fill in "camp_start_time" with "12/10/2011 11:00:00am"
      And I fill in "camp_end_time" with "12/15/2011 1:00:00pm"
      And I press "Create Camp"
      Then I should see "New Test Camp"
      And I should see "This camp will be blown away"
      And I should see "2011-12-10 11:00:00"
      And I should see "2011-12-15 13:00:00"

  Scenario: Successful new camp/session submission
    Given I am logged in as "Jane Doe" with email "doe@disney.com" having both privileges
      When I follow "admin_camps"
      And I follow "New Camp"
      And I fill in "camp_name" with "New Test Camp"
      And I fill in "camp_min_age" with "10"
      And I fill in "camp_max_age" with "15"
      And I fill in "camp_details" with "This camp will be blown away after the test is complete."
      And I fill in "camp_start_time" with "12/10/2011 11:00:00am"
      And I fill in "camp_end_time" with "12/15/2011 1:00:00pm"
      And I press "Create Camp"
      And I follow "Add Session"
      And I fill in "session_name" with "New Camp Session"
      And I fill in "session_start_date" with "12/11/2011 12:00:00pm"
      And I fill in "session_end_date" with "12/11/2011 5:00:00pm"
      And I fill in "session_code" with "NCS"
      And I fill in "session_description" with "Test session to be blown away"
      And I press "Create Session"
      Then I should see "New Camp Session"
      And I should see "Test session to be blown away"
      And I should see "2011-12-11 12:00:00"
      And I should see "2011-12-11 17:00:00"
      And I should see "NCS"
