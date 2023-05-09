class QuestionsController < ApplicationController
  before_action :load_formulary
  before_action :load_question, only: %i[ show update destroy ]

  # GET /questions
  def index
    @questions = @formulary.questions

    render json: @questions
  end

  # GET /questions/1
  def show
    render json: @question
  end

  # POST /questions
  def create
    @question = @formulary.questions.new(question_params)

    if @question.save
      render json: @question, status: :created
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      render json: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_question
      @question = @formulary.questions.find(params[:id])
    end

    def load_formulary
      @formulary = Formulary.find(params[:formulary_id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:name, :question_type, :content)
    end
end
