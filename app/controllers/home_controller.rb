class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @msg = Msg.new
    @messagee = Msg.where(u_id: current_user.id, user_id: @user.id) + Msg.where(u_id: @user.id, user_id: current_user.id)
    @messagee = @messagee.sort_by(&:created_at)
  end
end
