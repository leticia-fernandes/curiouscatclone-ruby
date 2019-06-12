class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  def create
    @answer = Answer.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to received_questions_path, notice: 'Question successfully answered.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { redirect_to received_questions_path, alert: 'Oops! Something went wrong... Make sure to write something to answer.' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_answer
    @answer = Answer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def answer_params
    params.require(:answer).permit(:content, :question_id)
  end
end
