class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image
      t.string :alt
      t.belongs_to :album, index: true

      t.timestamps
    end
  end
end
