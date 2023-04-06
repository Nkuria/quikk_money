class Api::V1::TopUpsController < ApplicationController
  before_action :set_top_up, only: %i[show update destroy]

  # GET /api/v1/top_ups
  def index
    @top_ups = @current_user.top_ups
    render json: serializer.new(@top_ups).serializable_hash
  end

  # GET /api/v1/top_ups/1
  def show
    render json: serializer.new(@top_up).serializable_hash
  end

  # POST /api/v1/top_ups
  def create
    @top_up = TopUp.new(top_up_params)
    @top_up.account = @current_user.account
    @top_up.status = 0
    @top_up.phone = @current_user.phone unless top_up_params[:phone]

    if @top_up.save
      @top_up.update_balance
      render json: serializer.new(@top_up).serializable_hash, status: :created
    else
      render json: @top_up.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/top_ups/1
  # def update
  #   if @top_up.update(top_up_params)
  #     render json: serializer.new(@top_up).serializable_hash
  #   else
  #     render json: @top_up.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /api/v1/top_ups/1
  # def destroy
  #   @top_up.destroy
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_top_up
    @top_up = TopUp.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def top_up_params
    params.require(:top_up).permit(:amount, :phone)
  end

  def serializer
    TopUpSerializer
  end
end
