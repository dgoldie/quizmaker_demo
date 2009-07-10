require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe QuizSession do
  dataset :users, :quizzes

  it "should create a new instance given valid attributes" do
    QuizSession.create!( :user => users(:doug), :quiz => quizzes(:first))
  end
end