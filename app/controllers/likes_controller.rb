class LikesController < ApplicationController
  before_action :set_like, only: %i[show edit update destroy]

  def create

    @like = current_user.likes.new(like_params)

    respond_to do |format|
      if @like.save
        format.html { redirect_back(fallback_location: :back, notice: 'Liked!') }
        format.json { render :show, status: :created, location: @like }
      else
        format.html { redirect_back(fallback_location: :back, alert: 'Oops... something went wrong! Reload the page and try again.') }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1.json
  def destroy
    @like.destroy
    respond_to do |format|
      format.html { redirect_to likes_url, notice: 'Like was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_like
    @like = Like.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def like_params
    params.require(:like).permit(:answer_id)
  end
end
