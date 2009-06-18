require File.dirname(__FILE__) + '/../spec_helper'

describe QuizzesController, "#route_for" do

  it "should map { :controller => 'Quizzes', :action => 'index' } to /Quizzes" do
    route_for(:controller => "Quizzes", :action => "index").should == "/Quizzes"
  end
  
  it "should map { :controller => 'Quizzes', :action => 'new' } to /Quizzes/new" do
    route_for(:controller => "Quizzes", :action => "new").should == "/Quizzes/new"
  end
  
  it "should map { :controller => 'Quizzes', :action => 'show', :id => 1 } to /Quizzes/1" do
    route_for(:controller => "Quizzes", :action => "show", :id => 1).should == "/Quizzes/1"
  end
  
  it "should map { :controller => 'Quizzes', :action => 'edit', :id => 1 } to /Quizzes/1/edit" do
    route_for(:controller => "Quizzes", :action => "edit", :id => 1).should == "/Quizzes/1/edit"
  end
  
  it "should map { :controller => 'Quizzes', :action => 'update', :id => 1} to /Quizzes/1" do
    route_for(:controller => "Quizzes", :action => "update", :id => 1).should == "/Quizzes/1"
  end
  
  it "should map { :controller => 'Quizzes', :action => 'destroy', :id => 1} to /Quizzes/1" do
    route_for(:controller => "Quizzes", :action => "destroy", :id => 1).should == "/Quizzes/1"
  end
  
end

describe QuizzesController, "handling GET /Quizzes" do

  before do
    @quiz = mock_model(Quiz)
    Quiz.stub!(:find).and_return([@quiz])
  end
  
  def do_get
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should render index template" do
    do_get
    response.should render_template('index')
  end
  
  it "should find all Quizzes" do
    Quiz.should_receive(:find).with(:all).and_return([@quiz])
    do_get
  end
  
  it "should assign the found Quizzes for the view" do
    do_get
    assigns[:quizzes].should == [@quiz]
  end
end

describe QuizzesController, "handling GET /Quizzes.xml" do

  before do
    @quiz = mock_model(Quiz, :to_xml => "XML")
    Quiz.stub!(:find).and_return(@quiz)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should find all Quizzes" do
    Quiz.should_receive(:find).with(:all).and_return([@quiz])
    do_get
  end
  
  it "should render the found Quiz as xml" do
    @quiz.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe QuizzesController, "handling GET /Quizzes/1" do

  before do
    @quiz = mock_model(Quiz)
    Quiz.stub!(:find).and_return(@quiz)
  end
  
  def do_get
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should render show template" do
    do_get
    response.should render_template('show')
  end
  
  it "should find the quiz requested" do
    Quiz.should_receive(:find).with("1").and_return(@quiz)
    do_get
  end
  
  it "should assign the found quiz for the view" do
    do_get
    assigns[:quiz].should equal(@quiz)
  end
end

describe QuizzesController, "handling GET /Quizzes/1.xml" do

  before do
    @quiz = mock_model(Quiz, :to_xml => "XML")
    Quiz.stub!(:find).and_return(@quiz)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should find the quiz requested" do
    Quiz.should_receive(:find).with("1").and_return(@quiz)
    do_get
  end
  
  it "should render the found quiz as xml" do
    @quiz.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe QuizzesController, "handling GET /Quizzes/new" do

  before do
    @quiz = mock_model(Quiz)
    Quiz.stub!(:new).and_return(@quiz)
  end
  
  def do_get
    get :new
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should render new template" do
    do_get
    response.should render_template('new')
  end
  
  it "should create an new quiz" do
    Quiz.should_receive(:new).and_return(@quiz)
    do_get
  end
  
  it "should not save the new quiz" do
    @quiz.should_not_receive(:save)
    do_get
  end
  
  it "should assign the new quiz for the view" do
    do_get
    assigns[:quiz].should equal(@quiz)
  end
end

describe QuizzesController, "handling GET /Quizzes/1/edit" do

  before do
    @quiz = mock_model(Quiz)
    Quiz.stub!(:find).and_return(@quiz)
  end
  
  def do_get
    get :edit, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should render edit template" do
    do_get
    response.should render_template('edit')
  end
  
  it "should find the quiz requested" do
    Quiz.should_receive(:find).and_return(@quiz)
    do_get
  end
  
  it "should assign the found quiz for the view" do
    do_get
    assigns[:quiz].should equal(@quiz)
  end
end

describe QuizzesController, "handling POST /Quizzes" do

  before do
    @quiz = mock_model(Quiz, :to_param => "1")
    Quiz.stub!(:new).and_return(@quiz)
  end
  
  def post_with_successful_save
    @quiz.should_receive(:save).and_return(true)
    post :create, :quiz => {}
  end
  
  def post_with_failed_save
    @quiz.should_receive(:save).and_return(false)
    post :create, :quiz => {}
  end
  
  it "should create a new quiz" do
    Quiz.should_receive(:new).with({}).and_return(@quiz)
    post_with_successful_save
  end

  it "should redirect to the new quiz on successful save" do
    post_with_successful_save
    response.should redirect_to(quiz_url("1"))
  end

  it "should re-render 'new' on failed save" do
    post_with_failed_save
    response.should render_template('new')
  end
end

describe QuizzesController, "handling PUT /Quizzes/1" do

  before do
    @quiz = mock_model(Quiz, :to_param => "1")
    Quiz.stub!(:find).and_return(@quiz)
  end
  
  def put_with_successful_update
    @quiz.should_receive(:update_attributes).and_return(true)
    put :update, :id => "1"
  end
  
  def put_with_failed_update
    @quiz.should_receive(:update_attributes).and_return(false)
    put :update, :id => "1"
  end
  
  it "should find the quiz requested" do
    Quiz.should_receive(:find).with("1").and_return(@quiz)
    put_with_successful_update
  end

  it "should update the found quiz" do
    put_with_successful_update
    assigns(:quiz).should equal(@quiz)
  end

  it "should assign the found quiz for the view" do
    put_with_successful_update
    assigns(:quiz).should equal(@quiz)
  end

  it "should redirect to the quiz on successful update" do
    put_with_successful_update
    response.should redirect_to(quiz_url("1"))
  end

  it "should re-render 'edit' on failed update" do
    put_with_failed_update
    response.should render_template('edit')
  end
end

describe QuizzesController, "handling DELETE /Quiz/1" do

  before do
    @quiz = mock_model(Quiz, :destroy => true)
    Quiz.stub!(:find).and_return(@quiz)
  end
  
  def do_delete
    delete :destroy, :id => "1"
  end

  it "should find the quiz requested" do
    Quiz.should_receive(:find).with("1").and_return(@quiz)
    do_delete
  end
  
  it "should call destroy on the found quiz" do
    @quiz.should_receive(:destroy)
    do_delete
  end
  
  it "should redirect to the Quizzes list" do
    do_delete
    response.should redirect_to(quizzes_url)
  end
end
