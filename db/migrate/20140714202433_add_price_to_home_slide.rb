class AddPriceToHomeSlide < ActiveRecord::Migration
  def change
    change_table :home_slides do |t|
      t.float :price
      t.string :link
    end

    change_table HomeSlide.translation_class.table_name do |t|
      t.string :link
    end
  end
end
