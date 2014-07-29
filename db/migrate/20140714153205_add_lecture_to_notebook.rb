class AddLectureToNotebook < ActiveRecord::Migration
  def change
    change_table :notebooks do |t|
      t.references :lecture
    end
  end
end
