require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RoleTag do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :role_name => "value for role_name"
    }
  end

  it "should create a new instance given valid attributes" do
    RoleTag.create!(@valid_attributes)
  end

  it "should limit role_names to 'author' or 'student'"
  

end
