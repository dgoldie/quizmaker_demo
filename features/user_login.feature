Feature: Account Creation

  As a site owner
  I want users to be able to login.
  So we can track users answering questions.

  Scenario: For an Registered user, he can login.
    Given an Registered user
    When he logs in
    Then he has a session
    And gets a welcome message