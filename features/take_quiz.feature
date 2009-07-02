Feature: Take Quiz

  As an Author
  I want to create a Quiz with Questions of various Answer Type
  I want to be display the quiz
  So Students can take the quiz and answer each question.

  Scenario: For a student, he can take a Quiz
    Given a user exists tagged as student
    And a quiz named "test quiz" with a question "favorite color?"
    When I take the quiz and give the answer "blue"
    Then I should be on take_quiz_path(1)
    And I should see "favorite color?"
    And I should see "blue"