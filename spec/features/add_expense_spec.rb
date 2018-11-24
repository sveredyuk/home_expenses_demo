require 'rails_helper'

RSpec.describe 'Add expense' do
  before { visit '/' }

  scenario 'has form' do
    within '#t-add-expense-form' do
      expect(page).to have_field('expense[amount]')
      expect(page).to have_select('expense[category_id]')
      expect(page).to have_button('Add')
    end
  end

  scenario 'can submit expense and has total amount' do
    within '#t-add-expense-form' do
      fill_in 'expense[amount]', with: '30'
      select 'Food', from: 'expense[category_id]'

      click_button 'Add'
    end

    created_expense = Expense.last

    within "#t-expense-#{created_expense.id}" do
      expect(page).to have_content '30'
      expect(page).to have_content 'Food'
      expect(page).to have_content created_expense.created_at.to_date
    end

    within '#t-add-expense-form' do
      fill_in 'expense[amount]', with: '20'
      select 'Beauty', from: 'expense[category_id]'

      click_button 'Add'
    end

    created_expense = Expense.last

    within "#t-expense-#{created_expense.id}" do
      expect(page).to have_content '20'
      expect(page).to have_content 'Beauty'
      expect(page).to have_content created_expense.created_at.to_date
    end

    within '#t-total-amount' do
      expect(page).to have_content '50'
    end
  end
end
