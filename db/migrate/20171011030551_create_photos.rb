class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.references :user, foreign_key: true
      t.text :caption
      t.text :image_data

      t.timestamps
    end
  end
end
