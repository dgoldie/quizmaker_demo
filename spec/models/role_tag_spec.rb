require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RoleTag do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :role_name => "author"
    }
  end

  it "should create a new  instance given valid attributes" do
    RoleTag.create!(@valid_attributes)
  end

  it "should be invalid if role_name is not a 'author' or 'student'" do
    @role = RoleTag.new( :user_id => 1 , :role_name => "illegal_name")
    @role.should have(1).error_on(:role_name)
  end

  # test for belongs_to relationship
  it "should have associated user" do
    @role = RoleTag.create!(@valid_attributes)
    @role.should respond_to('user')
  end

end
