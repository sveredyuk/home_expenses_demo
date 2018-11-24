class HomeController < ApplicationController
  helper_method :expense, :expenses, :total_amount

  private

  def expense
    @expense ||= Expense.new
  end

  def expenses
    @expenses ||= Expense.all
  end

  def total_amount
    @total_amount ||= Expense.sum(:amount)
  end
end
