class Api::V1::TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show]
  before_action :set_user, only: %i[index]

  # GET /api/v1/transactions
  def index
    @transactions = Transaction.where(sender_id: @current_user.id).or(Transaction.where(receiver_id: @current_user.id)).order(created_at: :desc)

    render json: serializer.new(@transactions).serializable_hash
  end

  # GET /api/v1/transactions/1
  def show
    render json: serializer.new(@transaction).serializable_hash
  end

  # POST /api/v1/transactions
  def create
    return render_error('Insufficient Balance', 422) if @current_user.account.balance < transaction_params[:amount]

    @transaction = @current_user.sent_transactions.build(transaction_params.slice(:amount))
    receiver = User.find_by(phone: transaction_params[:receiver_phone])
    return render_error('Could Not find User', 422) unless receiver

    @transaction.receiver = receiver
    @transaction.status = 0
    if @transaction.save
      render json: serializer.new(@transaction).serializable_hash, status: :created
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/transactions/1
  # def update
  #   if @transaction.update(transaction_params)
  #     render json: serializer.new(@transaction).serializable_hash
  #   else
  #     render json: @transaction.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /api/v1/transactions/1
  # def destroy
  #   @transaction.destroy
  # end

  def send_csv_via_email
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])
    @transactions = Transaction.where(sender_id: @current_user.id).or(Transaction.where(receiver_id: @current_user.id))
    transactions = @transactions.where(created_at: start_date.beginning_of_day..end_date.end_of_day)

    csv_data = transactions.to_csv

    TransactionMailer.send_csv(@current_user.email, csv_data).deliver_later

    render json: { message: 'CSV file will be sent to your email shortly' }, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transaction_params
    params.fetch(:transaction).permit(:amount, :receiver_phone)
  end

  def serializer
    TransactionSerializer
  end
end
