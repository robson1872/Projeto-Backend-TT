class AnswersController < ApplicationController
  before_action :load_formulary
  before_action :load_question
  before_action :load_answer, only: %i[ show update destroy ]


  def index
    @answers = @question.answers

    render json: @answers
  end


  def show
    render json: @answer
  end


  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      render json: @answer, status: :created
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  def update
    if @answer.update(answer_params)
      render json: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end


  def destroy
    @answer.destroy
  end

  private

    def load_answer
      @answer = @question.answers.find(params[:id])
    end

    def load_question
      @question = @formulary.questions.find(params[:question_id])
    end

    def load_formulary
      @formulary = Formulary.find(params[:formulary_id])
    end


    def answer_params
      params.require(:answer).permit(:content, :answered_at, :formulary_id)
    end
end
