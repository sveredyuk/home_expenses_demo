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

  scenario 'impossible add 0 cost expense' do
    within '#t-add-expense-form' do
      fill_in 'expense[amount]', with: '0'

      click_button 'Add'
    end

    within '#t-expenses-list' do
      expect(page).not_to have_content '0'
      expect(page).not_to have_content 'Food'
      expect(page).not_to have_content Time.current.to_date
    end
  end

  scenario 'impossible add negative cost expense' do
    within '#t-add-expense-form' do
      fill_in 'expense[amount]', with: '-333'

      click_button 'Add'
    end

    within '#t-expenses-list' do
      expect(page).not_to have_content '-333'
      expect(page).not_to have_content 'Food'
      expect(page).not_to have_content Time.current.to_date
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
