class CreateIncomes < ActiveRecord::Migration[5.0]
  def change
    create_table :incomes do |t|
      t.string :user_id
      t.string :title
      t.string :category
      t.integer :value
      t.string :currency
      t.string :entryDate

      t.timestamps
    end
  end
end
