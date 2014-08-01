class CreateNotebooks < ActiveRecord::Migration
  def change
    create_table :notebooks do |t|
      t.text :text
      t.string :title

      t.timestamps
    end
  end
end
