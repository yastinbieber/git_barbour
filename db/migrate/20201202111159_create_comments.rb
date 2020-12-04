class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :image
      t.string :title
      t.integer :price
      t.text :linkurl
      t.integer :user_id
    
      t.timestamps
    end
  end
end
