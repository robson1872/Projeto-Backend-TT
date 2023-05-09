class UsersController < ApplicationController
  before_action :load_user, only: %i[ show update destroy ]

  # GET /users
  def index
    @users = User.all

    render json: @users, status: 200
  end

  # GET /users/1
  def show
    render json: @user, status: 200
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: 201
    else
      render json: @user.errors, status: :unprocessable_entity, status: 503
    end
  end

  # PATCH/PUT /users/1
  def update
    unless @user.update(user_params)
      render json: {erros: @user.errors.full_messages}, status: 503
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:name, :email, :cpf, :password)
    end
end