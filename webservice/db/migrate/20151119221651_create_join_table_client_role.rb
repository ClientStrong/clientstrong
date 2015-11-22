class CreateJoinTableClientRole < ActiveRecord::Migration
  def change
    create_join_table :clients, :roles do |t|
      t.index [:client_id, :role_id]
      t.index [:role_id, :client_id]
    end
  end
end
