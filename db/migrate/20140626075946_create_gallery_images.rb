class CreateGalleryImages < ActiveRecord::Migration
  def change
    create_table :gallery_images do |t|
      t.string :name
      t.string :image
      t.belongs_to :gallery, index: true

      t.timestamps
    end
  end
end
