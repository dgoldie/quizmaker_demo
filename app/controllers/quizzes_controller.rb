class QuizzesController < ApplicationController
   before_filter :login_required, :except => [:index, :show]

  # GET /Quiz
  # GET /Quiz.xml
  def index
    @quizzes = Quiz.find(:all)

    respond_to do |format|
      format.html # index.haml
      format.xml  { render :xml => @quizzes }
    end
  end

  # GET /Quiz/1
  # GET /Quiz/1.xml
  def show
    @quiz = Quiz.find(params[:id])

    respond_to do |format|
      format.html # show.haml
      format.xml  { render :xml => @quiz }
    end
  end

  # GET /Quiz/new
  # GET /Quiz/new.xml
  def new
    @quiz = Quiz.new
    @questions = @quiz.questions
    
    respond_to do |format|
      format.html # new.haml
      format.xml  { render :xml => @quiz }
    end
  end

  # GET /Quiz/1/edit
  def edit
    @quiz = Quiz.find(params[:id])
  end

  # POST /Quiz
  # POST /Quiz.xml
  def create
    @quiz = Quiz.new(params[:quiz])
    @quiz.user = current_user

    respond_to do |format|
      if @quiz.save
        flash[:notice] = 'Quiz was successfully created.'
        format.html { redirect_to(quiz_path(@quiz)) }
        format.xml  { render :xml => @quiz, :status => :created, :location => @quiz }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @quiz.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /Quiz/1
  # PUT /Quiz/1.xml
  def update
    @quiz = Quiz.find(params[:id])

    respond_to do |format|
      if @quiz.update_attributes(params[:quiz])
        flash[:notice] = 'Quiz was successfully updated.'
        format.html { redirect_to(quiz_path(@quiz)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @quiz.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /Quiz/1
  # DELETE /Quiz/1.xml
  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy

    respond_to do |format|
      format.html { redirect_to(quizzes_url) }
      format.xml  { head :ok }
    end
  end
end
