class Payment < ActiveRecord::Base
  belongs_to :loan

  validates :payment_date, :payment_amount, :loan, presence: true

  validates_numericality_of :payment_amount,
    less_than_or_equal_to: ->(payment) {payment.loan.loan_balance},
    message: 'Enter an amount less than or equal to you balance'


  validates_numericality_of :payment_amount,
    greater_than: 0,
    message: 'Enter an amount greater than 0'

  validate :valid_payment_date

  private

  def valid_payment_date
    @payment_date = self.payment_date

    if @payment_date == nil
      self.payment_date = Time.now
    elsif @payment_date > Time.now
      raise ('Please enter a valid time')
    end

  end

end
