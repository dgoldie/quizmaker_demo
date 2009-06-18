Given /^a user tagged as author$/ do
  @user = User.create!(:username => 'dummy', 
                       :email => 'dummy@example.com',
                       :password => 'password', 
                       :password_confirmation => 'password')
  @user.tag_as_author
end

When /^he creates a Quiz named Dummy$/ do
  visit quizzes_path
  click_link "Add Quiz"
  fill_in "name" , :with => "Dummy"
  click_button "Save"
end

Then /^he gets Quiz show page$/ do
  pending
end

Then /^the name of the Quiz is displayed$/ do
  pending
end

Then /^gets a notice that the Quiz does not have any questions$/ do
  pending
end

Then /^gets form to create Questions$/ do
  pending
end

Given /^a Quiz$/ do
  pending
end

When /^he adds a question$/ do
  pending
end

Then /^he gets the Quiz show page$/ do
  pending
end

Then /^gets the question listed$/ do
  pending
end

Then /^gets the count of questions listed$/ do
  pending
end