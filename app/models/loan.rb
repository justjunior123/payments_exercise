class Loan < ActiveRecord::Base
  has_many :payments

  validates :funded_amount, presence: true
  validate :valid_funded_amount

  def loan_balance
    self.funded_amount - self.made_payments
  end

  def made_payments
    @made_payments = self.payments.sum(:payment_amount)

    if @made_payments == nil
      return @made_payments = 0
    else
      return @made_payments
    end

  end

  private

  def valid_funded_amount
    @funded_amount = self.funded_amount
    @funded_amount == nil ? @funded_amount = 0 : @funded_amount = self.funded_amount

    if @funded_amount < 0
      raise('Cannot be a negative number!')
    end

  end

end
