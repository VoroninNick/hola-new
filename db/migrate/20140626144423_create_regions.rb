class CreateRegions < ActiveRecord::Migration
  def up
    create_table :regions do |t|
      t.string :name
      t.text :description

      t.timestamps
    end

    Region.create_translation_table!
  end

  def down
    drop_table :regions

    Region.drop_translation_table!
  end
end
