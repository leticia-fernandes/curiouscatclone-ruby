class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy]

  # GET /questions
  # GET /questions.json
  def index; end

  # GET /received_questions
  def received_questions; end

  # GET /questions/1
  # GET /questions/1.json
  def show; end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit; end

  # POST /questions
  # POST /questions.json
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

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    # respond_to do |format|
    #   if @question.update(question_params)
    #     format.html { redirect_to @question, notice: 'Question was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @question }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @question.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    # @question.destroy
    # respond_to do |format|
    #   format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
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
