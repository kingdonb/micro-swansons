class AddClientsToTable < ActiveRecord::Migration[6.0]
  def change
    add_column :tables, :clients, :text, array: true, default: []
  end
end
