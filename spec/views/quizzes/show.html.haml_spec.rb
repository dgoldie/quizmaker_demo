require File.dirname(__FILE__) + '/../../spec_helper'

describe "/Quizzes/show.html.haml" do
  include QuizzesHelper
  
  before do
    @quiz = mock_model(Quiz)

    assigns[:quiz] = @quiz
  end

  it "should render attributes in <p>" do
    render "/Quizzes/show.html.haml"
  end
end

