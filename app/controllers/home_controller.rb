class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if user_signed_in?
      redirect_to me_path
    else
      render layout: false
    end
  end
end
