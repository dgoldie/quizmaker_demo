require File.dirname(__FILE__) + '/../../spec_helper'

describe "/Quizzes/new.html.haml" do
  include QuizzesHelper
  
  before do
    @quiz = mock_model(Quiz)
    @quiz.stub!(:new_record?).and_return(true)
    assigns[:quiz] = @quiz
  end

  it "should render new form" do
    render "/Quizzes/new.html.haml"
    
    response.should have_tag("form[action=?][method=post]", quizzes_path) do
    end
  end
end
