class CreateStats < ActiveRecord::Migration[5.2]
  def change
    create_table :stats do |t|
      t.integer :success
      t.integer :total

      t.timestamps
    end
  end
end
