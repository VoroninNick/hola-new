class RemoveNameFromAppartmentIconTranslation < ActiveRecord::Migration
  def change
    remove_column AppartmentIcon.translation_class.table_name, :name, :string
  end
end
