require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/questions/edit.html.erb" do
  include QuestionsHelper
  
  before(:each) do
    assigns[:question] = @question = stub_model(Question,
      :new_record? => false,
      :question_text => "value for question_text"
    )
  end

  it "renders the edit question form" do
    render
    
    response.should have_tag("form[action=#{question_path(@question)}][method=post]") do
      with_tag('input#question_question_text[name=?]', "question[question_text]")
    end
  end
end


