require 'rails_helper'
require 'spec_helper'

RSpec.describe PaymentsController, type: :controller do
  let(:loan) { Loan.create!(funded_amount: 500.0) }
  let(:payment) {loan.payments.create!({ payment_amount: 100, payment_date: Time.now })}

  describe "#index routes" do

    it 'responds with a 200 / ok status' do
      get :index, params: { loan_id: loan.id }
      expect(response).to have_http_status(200)
    end

    it 'responds with a 404 / not_found status' do
      get :index, params: { loan_id: 2}
      expect(response).to have_http_status(:not_found)
    end

    it 'has valid inputs and creates a payment with an ok response' do
      loan.payments.create!({ payment_amount: 5, payment_date: Time.now })
      expect(response).to have_http_status(200)
    end
  end

  describe "#show routes" do

    it 'responds with a 200 / ok status' do
      get :show, params: { loan_id: loan.id, id: payment.id }
      expect(response).to have_http_status(:ok)
    end

    it 'responds with a 404 / not_found status' do
      get :show, params: { loan_id: loan.id, id: 6 }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe '#create routes' do
    let(:loan2) { Loan.create!(funded_amount: 100.0) }

    it 'responds with a 200 / ok status' do
      post :create, params: { loan_id: loan2.id, payment_amount: 4, payment_date: Time.now }
      expect(response).to have_http_status(200)
    end

    it 'responds with a 404 / not_found status' do
      get :show, params: { loan_id: loan.id, id: 6 }
      expect(response).to have_http_status(:not_found)
    end
  end

end
