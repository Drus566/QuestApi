class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :success
      t.integer :total
      t.belongs_to :user, foreign_key: true, index: { unique: true }
      
      t.timestamps
    end
  end
end
