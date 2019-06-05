class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /explore
  def explore; end

  # POST /explore
  def find_user
    @users = User.where('username like ?', "%#{user_params[:username]}%")
    # @results = @users.size
    render 'explore'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:username)
  end
end
