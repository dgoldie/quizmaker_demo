require 'test_helper'

class QuizSessionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quiz_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quiz_session" do
    assert_difference('QuizSession.count') do
      post :create, :quiz_session => { }
    end

    assert_redirected_to quiz_session_path(assigns(:quiz_session))
  end

  test "should show quiz_session" do
    get :show, :id => quiz_sessions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => quiz_sessions(:one).to_param
    assert_response :success
  end

  test "should update quiz_session" do
    put :update, :id => quiz_sessions(:one).to_param, :quiz_session => { }
    assert_redirected_to quiz_session_path(assigns(:quiz_session))
  end

  test "should destroy quiz_session" do
    assert_difference('QuizSession.count', -1) do
      delete :destroy, :id => quiz_sessions(:one).to_param
    end

    assert_redirected_to quiz_sessions_path
  end
end
