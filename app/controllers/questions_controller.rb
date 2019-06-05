class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy]

  # GET /received_questions
  def received_questions; end

  def create
    @question = current_user.submitted_questions.new(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_back(fallback_location: profile_show_path(username: @question.addressee.username), notice: 'Question was successfully sent.') }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { redirect_back(fallback_location: profile_show_path(username: @question.addressee.username), alert: 'Oops! Something went wrong... Make sure to write something to send.') }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    params.require(:question).permit(:sender_id, :addressee_id, :content, :anonymous)
  end
end
