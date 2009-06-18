require File.dirname(__FILE__) + '/../../spec_helper'

describe "/Quiz/edit.html.haml" do
  include QuizzesHelper
  
  before do
    @quiz = mock_model(Quiz)
    assigns[:quiz] = @quiz
  end

  it "should render edit form" do
    render "/Quizzes/edit.html.haml"
    
    response.should have_tag("form[action=#{quiz_path(@quiz)}][method=post]") do
    end
  end
end