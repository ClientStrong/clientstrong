class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :email # must have
      t.string :password # must have
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :mobile
      t.date :birthday

      t.string :api_key
      t.timestamps null: false
    end
  end
end
