class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :price
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
