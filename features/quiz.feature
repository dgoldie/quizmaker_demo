Feature: Quiz Creation

  As an Author
  I want to create a Quiz
  I want to be able to add Questions
  So Students can take the quiz and answer questions

  Scenario: For an Author, he can create a Quiz
    Given a user exists tagged as author
    When I create a Quiz named Dummy
    And I press 'Save'
    Then I should be on quiz_path(1)
    And I should see "Quiz was successfully created"
    And I should see "This quiz does not have any questions yet"
    
  Scenario: For an Author, he can create a Quiz with Questions
    Given a user exists tagged as author
    When I create a Quiz named Dummy
    And I add a question "What is your favorite color?"
    And I press 'Save'
    Then I should be on quiz_path(1)
    And I should see "What is your favorite color?"
    And I should see "Total Questions: 1"