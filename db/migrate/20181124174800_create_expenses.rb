class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.float :amount, default: 0.0
      t.integer :category_id, index: true

      t.timestamps
    end
  end
end
