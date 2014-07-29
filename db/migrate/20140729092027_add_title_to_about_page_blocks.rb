class AddTitleToAboutPageBlocks < ActiveRecord::Migration
  def change
    rename_column :about_page_blocks, :title, :image_title
    add_column :about_page_blocks, :title, :string
  end
end
