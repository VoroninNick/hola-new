class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
      t.string :name
      t.string :path
      t.string :data
      t.string :controller
      t.string :action
      t.string :layout

      t.integer :custom_page_id
      t.string :custom_page_type

      t.timestamps
    end

   Page.create_translation_table!
  end

  def down
    drop_table :pages

    Page.drop_translation_table!
  end
end
