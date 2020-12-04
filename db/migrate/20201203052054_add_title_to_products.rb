class AddTitleToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :user_id, :integer
    add_column :products, :title, :string
    add_column :products, :price, :integer
    add_column :products, :linkurl, :text
    add_column :products, :image, :string
  end
end
