class CreateBankAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :bank_accounts do |t|
      t.string :user_id
      t.string :name
      t.string :status
      t.string :currency
      t.integer :balance
      t.string :description

      t.timestamps
    end
  end
end
