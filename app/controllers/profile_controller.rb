class ProfileController < ApplicationController

  def me
    @user = current_user
    render 'show'
  end

  def show
    @user = User.find_by(username: params[:username])
    render_not_found if @user.nil?
  end

  # GET /explore
  def search
    @users = User.where('username like ?', "%#{params[:username]}%") if params[:username].present?
    @message = "Nothing found" if @users.try(:empty?)
    @message = "Type username to search" if params[:username] == ''
    render 'explore'
  end

end
