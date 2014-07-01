class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :alt
      t.string :path
      t.string :file_name
      t.string :image

      t.timestamps
    end
  end
end
