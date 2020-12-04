class CreatePicpages < ActiveRecord::Migration[5.2]
  def change
    create_table :picpages do |t|
      t.string      :image
      t.string        :title
      t.timestamps
    end
  end
end
