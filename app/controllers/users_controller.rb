class UsersController < ApplicationController
  before_action :load_user, only: %i[ show update destroy ]

  def index
    @users = User.all

    render json: @users, status: 200
  end

  def show
    render json: @user, status: 200
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    unless @user.update(user_params)
      render json: {erros: @user.errors.full_messages}, status: 503
    end
  end

  def destroy
    @user.destroy
  end

  private
    def load_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :cpf, :password)
    end
end
