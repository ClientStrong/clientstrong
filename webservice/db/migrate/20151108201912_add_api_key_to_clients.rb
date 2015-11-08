class AddApiKeyToClients < ActiveRecord::Migration
  def change
    add_column :clients, :api_key, :string
  end
end
