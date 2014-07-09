class AddColumnRenderFromAppartmentToHomeSlide < ActiveRecord::Migration
  def change
    change_table :home_slides do |t|
      t.boolean :render_from_appartment
      t.belongs_to :appartment
    end

  end
end
