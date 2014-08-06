class CreateNotebooks < ActiveRecord::Migration
  def change
    create_table :notebooks do |t|
      t.text :text
      t.string :title
      t.date :date

      t.timestamps
    end
  end
end
