require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
    @comment = comments(:one)
  end

  test "should get index" do
    get :index, params: { project_id: @project }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { project_id: @project }
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, params: { project_id: @project, comment: @comment.attributes }
    end

    assert_redirected_to project_comment_path(@project, Comment.last)
  end

  test "should show comment" do
    get :show, params: { project_id: @project, id: @comment }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { project_id: @project, id: @comment }
    assert_response :success
  end

  test "should update comment" do
    put :update, params: { project_id: @project, id: @comment, comment: @comment.attributes }
    assert_redirected_to project_comment_path(@project, Comment.last)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, params: { project_id: @project, id: @comment }
    end

    assert_redirected_to project_comments_path(@project)
  end
end
