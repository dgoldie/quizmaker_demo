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

Then /^I should see a link "([^\"]*)"$/ do | link |
  assert_have_selector "a", :href => "/questions/new"
end

Given /^a quiz exists named "([^\"]*)"$/ do |name|
  Quiz.create!(:user => @user, :name => name)
end

When /^I add a question "([^\"]*)"$/ do |ask|
  visit new_question_path
  assert_have_selector 'p.question:first-of-type'

  within "p.question:first-of-type" do |scope|
    scope.fill_in "*question_text", ask
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