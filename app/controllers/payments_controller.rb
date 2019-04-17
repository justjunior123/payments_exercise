class PaymentsController < ActionController::API

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'Does Not Exist', status: :not_found
  end

  def show
    render json: Payment.find(params[:id])
  end

  def create
    @payment = Payment.create!(payment_params)

    render json: @payment
  end

  def index
    render json: Loan.find(params[:loan_id]).payments
  end

  private

  def payment_params
    params.permit(:payment_amount, :payment_date, :loan_id)
  end

end
