class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.text :description
    end
  end
end
