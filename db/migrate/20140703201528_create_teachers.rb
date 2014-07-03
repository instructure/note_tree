class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
		t.references :accountable, :polymorphic => true
    end
  end
end
