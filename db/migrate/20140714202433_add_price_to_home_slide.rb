class AddPriceToHomeSlide < ActiveRecord::Migration
  def change
    add_column :home_slides, :price, :float
  end
end
