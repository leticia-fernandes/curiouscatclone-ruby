class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to profile_index_path
    else
      render :layout => false
    end
  end
end
