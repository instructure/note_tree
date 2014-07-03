class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references :accountable, :polymorphic => true
      
      t.string :password
      t.string :password_confirmation
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :id_integer
    end
  end
end
