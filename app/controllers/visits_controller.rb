class VisitsController < ApplicationController
  before_action :authentication
  before_action :load_user
  before_action :load_visit, only: %i[ show update destroy ]

  # GET /visits
  def index
    @visits = @user.visits

    render json: @visits
  end

  # GET /visits/1
  def show
    render json: @visit
  end

  # POST /visits
  def create
    @visit = @user.visits.new(visit_params)

    if @visit.save
      render json: @visit, status: :created
    else
      render json: @visit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /visits/1
  def update
    if @visit.update(visit_params)
      render json: @visit
    else
      render json: @visit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /visits/1
  def destroy
    @visit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_visit
      @visit = @user.visits.find(params[:id])
    end

    def load_user
      decode_data = decode_user_data(request.headers["token"])
      user_data = decode_data[0]["user_data"] unless !decode_data
      @user = User.find(user_data)
    end

    # Only allow a list of trusted parameters through.
    def visit_params
      params.require(:visit).permit(:status, :data, :checkin_at, :checkout_at)
    end
end
