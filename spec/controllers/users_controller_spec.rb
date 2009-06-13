require File.dirname(__FILE__) + '/../spec_helper'
 
describe UsersController do
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    User.stub!(:new).and_return mock_model(User, :save => false)
    post :create, :user => {}
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    User.stub!(:new).and_return mock_model(User, :save => true)
    post :create
    response.should redirect_to(root_path)
    session['user_id'].should == assigns['user'].id
  end
end
