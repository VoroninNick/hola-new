class CreateAboutPageBlocks < ActiveRecord::Migration
  def up
    create_table :about_page_blocks do |t|
      t.text :content
      t.string :image
      t.string :title
      t.string :alt

      t.belongs_to :about_page

      t.timestamps
    end

    AboutPageBlock.create_translation_table!
  end

  def down
    drop_table :about_page_blocks

    AboutPageBlock.drop_translation_table!
  end
end
