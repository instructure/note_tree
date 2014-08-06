class AddAccountToNotebook < ActiveRecord::Migration
  def change
    add_column :notebooks, :account_id, :integer
  end
end
