class CreateMenuItems < ActiveRecord::Migration
  def up
    create_table :menus do |t|
      t.string :name
    end

    create_table :menu_items do |t|

      t.string :name
      t.string :link
      t.boolean :linked_to_page
      t.belongs_to :page

      t.belongs_to :menu

      t.string :ancestry, :index => true

      t.timestamps
    end

    MenuItem.create_translation_table!
  end

  def down
    drop_table :menus

    drop_table :menu_items

    MenuItem.drop_translation_table!
  end
end
