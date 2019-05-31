class ProfileController < ApplicationController

  def me
    @user = current_user
    render 'show'
  end

  def show
    @user = User.find_by(username: params[:username])
    render_not_found if @user.nil?
  end

end
