require 'rails_helper'
require 'spec_helper'

RSpec.describe Loan, type: :model do

  let(:loan1) { Loan.create( funded_amount: 200) }
  let(:loan2) { Loan.create( funded_amount: nil) }
  let(:loan3) { Loan.create( funded_amount: -300) }

  describe "#Loan Validations" do
    # Thorough check of loan1************************************
    it " Creates a new Loan object with a new funded_amount" do
      expect {loan1}.not_to raise_error
    end

    it " Should have a value of 200" do
      expect(loan1.funded_amount).to eq( 200 )
    end

    it " Is valid with correct inputs" do
      expect(loan1).to be_valid
    end

    # Thorough check of loan2************************************
    it " Does not accept an invalid funded_amount" do
      expect( loan2 ).to_not be_valid
      expect( loan2.errors.full_messages ).to include("Funded amount can't be blank")
    end

    # Thorough check of loan3************************************
    context " It will raise error for a negative amount" do
      it " Will not accept a negative amount while being created " do
        expect{loan3}.to raise_error(RuntimeError)
      end
    end

  end

  describe "#Loan Properties" do
    it { should validate_presence_of(:funded_amount) }
    it { is_expected.to respond_to :funded_amount }

    context " It should respond to loan_balance" do
      it { expect(loan1.payments).to eq([]) }
      it { expect(loan1.loan_balance).to eq(loan1.funded_amount)}
    end

    context " It should respond to a payment" do
      let(:first_payment) { loan1.payments.create!(payment_amount: 100,payment_date: Time.now) }
      let(:second_payment) { loan1.payments.create!(payment_amount: 50,payment_date: Time.now) }
      let(:third_payment) { loan1.payments.create!(payment_amount: 20,payment_date: Time.now) }

      it " should have a payment made" do
        expect(loan1.payments).to eq([first_payment])
        expect(loan1.loan_balance).to eq(100)
      end

      it " should have multiple recorded payments made with a new loan_balance" do
        expect(loan1.payments).to eq([first_payment,second_payment,third_payment])
        expect(loan1.loan_balance).to eq(30)
      end
    end

    describe "#Loan Associations" do
      it { should have_many :payments }
    end
  end
end
