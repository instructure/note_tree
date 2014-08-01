class DeleteDateFromNotebook < ActiveRecord::Migration
  def change
    remove_column :notebooks, :date
  end
end
