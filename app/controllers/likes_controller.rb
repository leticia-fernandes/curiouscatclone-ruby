class LikesController < ApplicationController
  before_action :set_like, only: [:destroy]

  def create

    @like = current_user.likes.new(like_params)

    respond_to do |format|
      if @like.save
        format.html { redirect_back(fallback_location: profile_show_path(@like.addressee.username), notice: 'Liked!') }
        format.json { render :show, status: :created, location: @like }
      else
        format.html { redirect_back(fallback_location: profile_show_path(@like.addressee.username), alert: 'Oops... something went wrong! Reload the page and try again.') }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1.json
  def destroy
    @like.destroy
    respond_to do |format|
      format.html {  redirect_back(fallback_location: profile_show_path(@like.addressee.username), notice: 'Unliked!') }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_like
    @like = Like.find(like_params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def like_params
    params.require(:like).permit(:answer_id, :id)
  end
end
