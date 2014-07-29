class AddTitleToAboutPageBlockTranslation < ActiveRecord::Migration
  def up
    rename_column AboutPageBlock.translation_model.table_name, :title, :image_title
    add_column AboutPageBlock.translation_model.table_name, :title, :string
  end
end
