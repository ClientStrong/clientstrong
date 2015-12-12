class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.text :description
      t.integer :author # member_id or more likely session_member_id      t.integer :duration
      t.integer :intensity
      t.string :image_url
      t.string :video_url
    end
  end
end
