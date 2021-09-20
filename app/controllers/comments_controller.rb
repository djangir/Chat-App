class CommentsController < ApplicationController
  before_action :set_project
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  before_action :checkk, only: [:edit, :update, :destroy]

  # GET projects/1/comments
  def index
    @comments = @project.comments
  end

  # GET projects/1/comments/1
  def show
  end

  # GET projects/1/comments/new
  def new
    @comment = @project.comments.build
  end

  # GET projects/1/comments/1/edit
  def edit
  end

  # POST projects/1/comments
  def create
    @comment = @project.comments.build(comment_params)

    if @comment.save
      redirect_to @project , notice: 'created.'
    else
      render action: 'new'
    end
  end

  # PUT projects/1/comments/1
  def update
    if @comment.update(comment_params)
      redirect_to @project , notice: 'updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE projects/1/comments/1
  def destroy
    @comment.destroy

    redirect_to @project, notice: 'Deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_comment
      @comment = @project.comments.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      m_params = params.require(:comment).permit(:user_id, :text)

      m_params[:user_id] = current_user.id
      m_params
    end

    def checkk
      if @comment.user_id != current_user.id
        redirect_to root_path, notice: "Try Again"
      end
    end
end
