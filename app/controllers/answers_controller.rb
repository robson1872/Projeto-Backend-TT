class AnswersController < ApplicationController
  before_action :load_formulary
  before_action :load_question
  before_action :load_answer, only: %i[ show update destroy ]

  # GET /answers
  def index
    @answers = @question.answers

    render json: @answers
  end

  # GET /answers/1
  def show
    render json: @answer
  end

  # POST /answers
  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      render json: @answer, status: :created
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /answers/1
  def update
    if @answer.update(answer_params)
      render json: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /answers/1
  def destroy
    @answer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_answer
      @answer = @question.answers.find(params[:id])
    end

    def load_question
      @question = @formulary.questions.find(params[:question_id])
    end

    def load_formulary
      @formulary = Formulary.find(params[:formulary_id])
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.permit(:content, :answered_at, :formulary_id)
    end
end
