class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :first_user
      t.references :second_user
      t.string :first_round
      t.string :second_round
      t.string :third_round
      t.boolean :completed, :default => false

      t.timestamps
    end
  end
end
