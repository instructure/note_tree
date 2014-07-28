class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
    	t.references :account
    end
  end
end
