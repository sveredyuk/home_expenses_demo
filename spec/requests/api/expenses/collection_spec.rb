require 'rails_helper'

RSpec.describe 'GET api/expenses' do
  it 'render expenses collection' do
    expense_a = Expense.create!(amount: 30, category_id: 1)
    expense_b = Expense.create!(amount: 20, category_id: 2)

    get '/api/expenses'

    expect(response.status).to eq 200

    expect(body['expenses'].count).to eq 2
    expect(body['expenses'][0]['id']).to eq expense_a.id
    expect(body['expenses'][0]['amount']).to eq expense_a.amount
    expect(body['expenses'][1]['id']).to eq expense_b.id
    expect(body['expenses'][1]['amount']).to eq expense_b.amount
  end
end
