require File.dirname(__FILE__) + '/../../spec_helper'

describe "/Quizzes/index.html.haml" do
  include QuizzesHelper
  
  before do
    quiz_98 = mock_model(Quiz)
    quiz_99 = mock_model(Quiz)

    assigns[:quizzes] = [quiz_98, quiz_99]
  end

  it "should render list of quizzes" do
    render "/Quizzes/index.html.haml"
  end
end
