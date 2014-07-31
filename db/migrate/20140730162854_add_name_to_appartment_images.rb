class AddNameToAppartmentImages < ActiveRecord::Migration
  def change
    add_column :appartment_images, :name, :string
  end
end
