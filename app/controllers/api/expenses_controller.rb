module Api
  class ExpensesController < BaseController
    def index
      render json: { expenses: ::Expense.all }
    end

    def create
      expense = Expense.new(expense_params)

      if expense.save
        render json: { expense: expense }, status: :created
      else
        render json: { errors: expense.errors }, status: :unprocessable_entity
      end
    end

    private

    def expense_params
      params.require(:expense).permit(:amount, :category_id)
    end
  end
end
