Given /^a user exists tagged as author$/ do
  @user = User.create!(:username => 'dummy', 
                       :email => 'dummy@example.com',
                       :password => 'password', 
                       :password_confirmation => 'password')
  @user.tag_as_author
end

When /^I create a Quiz named Dummy$/ do
  visit quizzes_path
  click_link "Add Quiz"
  fill_in "name" , :with => "Dummy"
end

Given /^a quiz exists named "([^\"]*)"$/ do |name|
  Quiz.create!(:user => @user, :name => name)
end

When /^I add a question "([^\"]*)"$/ do |ask|
  within "p.question:first-of-type" do |scope|
    scope.fill_in /quiz.*question_text/, ask
  end
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