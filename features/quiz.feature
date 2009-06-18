Feature: Quiz Creation

  As an Author
  I want to create a Quiz
  I want to be able to add Questions
  So Students can take the quiz and answer questions

  Scenario: For an Author, he can create a Quiz
    Given a user tagged as author
    When he creates a Quiz named Dummy
    Then he gets Quiz show page
    And the name of the Quiz is displayed
    And gets a notice that the Quiz does not have any questions
    And gets form to create Questions
    
  Scenario: For an Author, with a Quiz, he can add Questions
    Given a user tagged as author
    And a Quiz
    When he adds a question
    Then he gets the Quiz show page
    And gets the question listed
    And gets the count of questions listed