class CreateSavingGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :saving_goals do |t|
      t.string :user_id
      t.string :description
      t.string :deadline
      t.integer :value

      t.timestamps
    end
  end
end
