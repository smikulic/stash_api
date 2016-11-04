class RenameEntryDateAttribute < ActiveRecord::Migration[5.0]
  def change
    remove_column :incomes, :entryDate, :string
    add_column :incomes, :entry_date, :string
  end
end
