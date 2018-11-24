require 'rails_helper'

RSpec.describe 'POST api/expenses' do
  context 'valid params' do
    it 'creates new expense' do
      post '/api/expenses', params: { expense: { amount: '30', category_id: 1 } }

      expect(response.status).to eq 201
      expect(body['expense']['id']).to be_present
      expect(body['expense']['amount']).to eq 30.0
      expect(body['expense']['category_id']).to eq 1
    end
  end

  context 'valid params' do
    it 'creates new expense' do
      post '/api/expenses', params: { expense: { amount: '0', category_id: 1 } }

      expect(response.status).to eq 422
      expect(body['errors']).to be_present
    end
  end
end
