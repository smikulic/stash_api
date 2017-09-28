class DropIncomes < ActiveRecord::Migration[5.0]
  def change
    drop_table :incomes
  end
end
