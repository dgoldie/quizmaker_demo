
Given /^an Registered user$/ do
  u = User.create( :username => "dan",
                   :email => "dan@funnyfarm.com",
                   :password => "password",
                   :password_confirmation => "password")
end

When /^he logs in$/ do
  visit login_path
  fill_in "login", :with => "dan"
  fill_in "password", :with => "password"
  click_button
end

Then /^he has a session$/ do
  assert_equal "dan", User.find(session[:user_id]).username
end