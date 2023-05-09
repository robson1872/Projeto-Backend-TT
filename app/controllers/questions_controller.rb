class QuestionsController < ApplicationController
  before_action :load_formulary
  before_action :load_question, only: %i[ show update destroy ]

  def index
    @questions = @formulary.questions

    render json: @questions
  end

  def show
    render json: @question
  end

  def create
    @question = @formulary.questions.new(question_params)

    if @question.save
      render json: @question, status: :created
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  def update
    if @question.update(question_params)
      render json: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @question.destroy
  end

  private
    def load_question
      @question = @formulary.questions.find(params[:id])
    end

    def load_formulary
      @formulary = Formulary.find(params[:formulary_id])
    end

    def question_params
      params.require(:question).permit(:name, :question_type, :content)
    end
end
