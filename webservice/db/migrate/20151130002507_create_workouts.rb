class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :title
      t.integer :duration
      t.integer :intensity
      t.text :description
    end
  end
end
