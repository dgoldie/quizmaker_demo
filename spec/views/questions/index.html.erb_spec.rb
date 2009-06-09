require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/questions/index.html.erb" do
  include QuestionsHelper
  
  before(:each) do
    assigns[:questions] = [
      stub_model(Question,
        :question_text => "value for question_text"
      ),
      stub_model(Question,
        :question_text => "value for question_text"
      )
    ]
  end

  it "renders a list of questions" do
    render
    response.should have_tag("tr>td", "value for question_text".to_s, 2)
  end
end

