require 'rails_helper'
require 'spec_helper'

RSpec.describe Payment, type: :model do
  let(:loan){ Loan.create(funded_amount: 1000) }

  describe "#Payment Validations" do
    subject{ described_class.new(loan: loan, payment_amount: 500, payment_date: Time.now) }

    it { should validate_presence_of(:payment_amount) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without an amount" do
       subject.payment_amount = nil
       expect(subject).to_not be_valid
    end

    it "is not valid with an amount less than zero" do
       subject.payment_amount = -300
       expect(subject).to_not be_valid
    end

    it "is not valid with an amount greater than what you owe" do
      subject.payment_amount = 3000
      expect(subject).to_not be_valid
    end
  end

  describe '#Payment Properties' do
    it { is_expected.to respond_to :payment_date }
    it { is_expected.to respond_to :payment_amount }
  end

  describe '#Payments Associations' do
    it { should belong_to :loan }
  end

end
