Given /^a user exists tagged as student$/ do
  @user = User.create!(:username => 'dummy',
                       :email => 'dummy@example.com',
                       :password => 'password',
                       :password_confirmation => 'password')
  @user.tag_as_student
end

Given /^a quiz named "([^\"]*)" with a question "([^\"]*)"$/ do |name, question|
  @quiz = Quiz.create!( :name => name)
  @quiz.questions << Question.create!( :question_text => question)
end

When /^I take the quiz and give the answer "([^\"]*)"$/ do |answer|
  visit take_quiz_path(1)
  fill_in "answer_text", :with => answer
  click_button 'Save'
end