require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Answer do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :question_id => 1,
      :value => "test answer"
    }
  end

  it "should create a new instance given valid attributes" do
    Answer.create!(@valid_attributes)
  end

    # test for belongs_to relationships
  it "should have associated user and question" do
    @answer = Answer.create!(@valid_attributes)
    @answer.should respond_to('user')
    @answer.should respond_to('question')
  end
end
