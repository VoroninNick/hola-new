class CreateAppartmentIcons < ActiveRecord::Migration
  def change
    create_table :appartment_icons do |t|
      t.string :image
      t.string :name
      t.string :tooltip

      t.timestamps
    end

    create_table :appartment_and_appartment_icon_links do |t|
      t.belongs_to :appartment
      t.belongs_to :appartment_icon
    end
  end
end
