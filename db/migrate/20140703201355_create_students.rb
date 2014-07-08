class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
    	t.references :accountable, :polymorphic => true
    end
  end
end
