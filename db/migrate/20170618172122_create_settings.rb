class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.string :user_id
      t.integer :average_monthly_incomes
      t.integer :average_monthly_expenses
      t.string :main_currency

      t.timestamps
    end
  end
end
