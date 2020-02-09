class AddOwnerIpToFork < ActiveRecord::Migration[6.0]
  def change
    add_column :forks, :owner_ip, :text
  end
end
