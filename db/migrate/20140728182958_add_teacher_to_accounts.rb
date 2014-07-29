class AddTeacherToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :teacher_id, :integer
  end
end
