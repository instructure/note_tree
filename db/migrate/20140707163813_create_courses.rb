class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :short_name
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
