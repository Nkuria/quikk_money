class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[update]
  skip_before_action :authorize_request, only: %i[create login]

  # GET /api/v1/users
  def index
    @users = User.all.includes(:account)

    render json: serializer.new(@users).serializable_hash
  end

  # GET /api/v1/users/1
  def show
    render json: serializer.new(@current_user).serializable_hash
  end

  # POST /api/v1/users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: serializer.new(@user).serializable_hash, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/users/1
  def update
    if @user.update(user_params)
      render json: serializer.new(@user).serializable_hash
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/1
  # def destroy
  #   @user.destroy
  # end

  def login
    @user = User.find_by_phone(user_params[:phone])
    if @user&.authenticate(user_params[:password])
      render json: {
        token: JsonWebToken.encode(user_id: @user.id),
        phone: @user.phone
      }
    else
      head :unauthorized
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email, :first_name, :middle_name, :password, :phone, :surname)
  end

  def serializer
    UserSerializer
  end
end
