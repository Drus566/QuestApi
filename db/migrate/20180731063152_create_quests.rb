class CreateQuests < ActiveRecord::Migration[5.2]
  def change
    create_table :quests do |t|
      t.text :question
      t.string :answer
      t.text :options

      t.timestamps
    end
  end
end
