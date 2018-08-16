class AddReadyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ready, :boolean, :default => false
  end
end
