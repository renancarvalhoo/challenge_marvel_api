class CreateUpvotes < ActiveRecord::Migration[6.1]
  def change
    create_table :upvotes do |t|
      t.text :session_id
      t.integer :comic_id

      t.timestamps
    end
  end
end
