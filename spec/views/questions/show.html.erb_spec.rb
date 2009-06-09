require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/questions/show.html.erb" do
  include QuestionsHelper
  before(:each) do
    assigns[:question] = @question = stub_model(Question,
      :question_text => "value for question_text"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ question_text/)
  end
end

