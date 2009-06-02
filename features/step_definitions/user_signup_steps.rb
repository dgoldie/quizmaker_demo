
Given /^an anonymous user$/ do
  
  #assert_equal false, session.include?(:user_id)
end

When /^he signs up$/ do
  visit signup_path
  fill_in "user_username", :with => "Doug"
  fill_in "user_email", :with => "dgoldie15@gmail.com"
  fill_in "user_password", :with => "password"
  fill_in "user_password_confirmation", :with => "password"
  click_button
end

Then /^he has a user account$/ do
  response.should contain("Thank you for signing up! You are now logged in.")
end

Then /^gets a welcome message$/ do
  user = User.find session[:user_id]
  response.should contain("Welcome #{user.username}!")
end