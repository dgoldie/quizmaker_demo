require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Question do
  before(:each) do
    @valid_attributes = {
      :question_text => "value for question_text"
    }
  end

  it "should create a new instance given valid attributes" do
    Question.create!(@valid_attributes)
  end
end
