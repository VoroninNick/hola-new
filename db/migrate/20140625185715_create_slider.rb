class CreateSlider < ActiveRecord::Migration
  def up
    %w(Home Appartment).each do |slider_class|
      create_table "#{slider_class.to_s.downcase}_sliders" do |t|
        t.string :name

        t.integer :sliderable_id
        t.string :sliderable_type

        t.timestamps
      end

      create_table "#{slider_class.to_s.downcase}_slides" do |t|
        t.string :title
        t.string :description
        t.string :image
        t.integer :slider_id
        t.string :slider_type

        t.timestamps
      end

      Object.const_get("#{slider_class.to_s}Slide").create_translation_table!

    end



  end

  def down
    %w(Home Appartment).each do |slider_class|
      drop_table "#{slider_class.to_s.downcase}_sliders"

      drop_table "#{slider_class.to_s.downcase}_slides"

      Object.const_get("#{slider_class.to_s}Slide").drop_translation_table!
    end
  end
end
