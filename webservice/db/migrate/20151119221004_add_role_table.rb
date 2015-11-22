class AddRoleTable < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string  :name
      t.string :description
    end
  end
end
