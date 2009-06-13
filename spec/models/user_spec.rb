require File.dirname(__FILE__) + '/../spec_helper'

describe User do

  include UsersSpecHelper

  before :each do
    @user = User.new
  end
    
  it "should be valid" do
    @user.attributes = valid_user_attributes
    @user.should be_valid
  end

  it "should require username" do
    @user.should have(1).error_on(:username)
  end

  it "should require password" do
    @user.should have(1).error_on(:password)
  end

  it "should require well formed email" do
    @user.attributes = valid_user_attributes.update(:email => 'foo@bar@example.com')
    @user.should have(1).error_on(:email)
  end

  it "should validate uniqueness of email" do
    @user.attributes = valid_user_attributes
    @user.save!
    @user2 = User.new
    @user2.attributes = valid_user_attributes.update(:username => 'doug')
    @user2.should have(1).error_on(:email)
  end

  it "should validate uniqueness of username" do
    @user.attributes = valid_user_attributes
    @user.save!
    @user2 = User.new
    @user2.attributes = valid_user_attributes.update(:email => 'doug@widget.com')
    @user2.should have(1).error_on(:username)
  end

  it "should not allow odd characters in username" do
    @user.attributes = valid_user_attributes.update(:username => 'odd ^&(@)')
    @user.should have(1).error_on(:username)
  end

  it "should validate password is longer than 3 characters" do
    @user.attributes = 
      valid_user_attributes.update(:password => 'bad',
                                   :password_confirmation => 'bad')
    @user.should have(1).error_on(:password)
  end

  it "should require matching password confirmation" do
    @user.attributes = 
      valid_user_attributes.update(:password_confirmation => 'nonmatching')
    @user.should have(1).error_on(:password)
  end

  it "should generate password hash and salt on create" do
    @user.attributes = valid_user_attributes
    @user.save!
    @user.password_hash.should_not be_nil
    @user.password_salt.should_not be_nil
  end
  
  it "should authenticate by username" do
    @user.attributes = valid_user_attributes
    @user.save!
    User.authenticate('joseph', 'password').should == @user
  end
  
  it "should authenticate by email" do
    @user.attributes = valid_user_attributes
    @user.save!
    User.authenticate('joseph@widget.com', 'password').should == @user
  end

  it "should not authenticate bad username" do
    @user.attributes = valid_user_attributes
    @user.save!
    debugger
    User.authenticate('nonexisting', 'secret').should be_nil
  end

  it "should not authenticate bad password" do
    @user.attributes = valid_user_attributes
    @user.save!
    User.authenticate('joseph', 'badpassword').should be_nil
  end
end
