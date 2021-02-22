class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :marvel_id

      t.timestamps
    end
    add_index :characters, :marvel_id
  end
end
