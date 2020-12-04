class CreateBios < ActiveRecord::Migration[5.2]
  def change
    create_table :bios do |t|
      t.string      :image
      t.string      :title
      t.text        :text
      t.integer     :user_id

      t.timestamps
    end
  end
end
