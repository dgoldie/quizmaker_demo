require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/questions/new.html.erb" do
  include QuestionsHelper
  
  before(:each) do
    assigns[:question] = stub_model(Question,
      :new_record? => true,
      :question_text => "value for question_text"
    )
  end

  it "renders new question form" do
    render
    
    response.should have_tag("form[action=?][method=post]", questions_path) do
      with_tag("input#question_question_text[name=?]", "question[question_text]")
    end
  end
end


