class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.references :course, index: true
      t.date :date
      t.string :title
      t.text :summary

      t.timestamps
    end
  end
end
