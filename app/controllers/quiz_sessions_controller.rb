class QuizSessionsController < ApplicationController
  # GET /quiz_sessions
  # GET /quiz_sessions.xml
  def index
    @quiz_sessions = QuizSession.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quiz_sessions }
    end
  end

  # GET /quiz_sessions/1
  # GET /quiz_sessions/1.xml
  def show
    @quiz_session = QuizSession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quiz_session }
    end
  end

  # GET /quiz_sessions/new
  # GET /quiz_sessions/new.xml
  def new
    @quiz_session = QuizSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @quiz_session }
    end
  end

  # GET /quiz_sessions/1/edit
  def edit
    @quiz_session = QuizSession.find(params[:id])
  end

  # POST /quiz_sessions
  # POST /quiz_sessions.xml
  def create
    @quiz_session = QuizSession.new(params[:quiz_session])

    respond_to do |format|
      if @quiz_session.save
        flash[:notice] = 'QuizSession was successfully created.'
        format.html { redirect_to(@quiz_session) }
        format.xml  { render :xml => @quiz_session, :status => :created, :location => @quiz_session }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @quiz_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /quiz_sessions/1
  # PUT /quiz_sessions/1.xml
  def update
    @quiz_session = QuizSession.find(params[:id])

    respond_to do |format|
      if @quiz_session.update_attributes(params[:quiz_session])
        flash[:notice] = 'QuizSession was successfully updated.'
        format.html { redirect_to(@quiz_session) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @quiz_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /quiz_sessions/1
  # DELETE /quiz_sessions/1.xml
  def destroy
    @quiz_session = QuizSession.find(params[:id])
    @quiz_session.destroy

    respond_to do |format|
      format.html { redirect_to(quiz_sessions_url) }
      format.xml  { head :ok }
    end
  end
end
