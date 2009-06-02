Feature: Account Creation

  As a site owner
  I want users to be able to create an account
  So that users are encouraged to return to the site

  Scenario: We can create users for our features
    Given there are 4 users

  Scenario: For an Anonymous user, he can signup.
    Given an anonymous user
    When he signs up
    Then he has a user account
    And gets a welcome message
