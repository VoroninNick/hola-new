class MakeRegionsAndAppartmentsHasAndBelongsToMany < ActiveRecord::Migration
  def change
    remove_column :appartments, :region_id, :integer
    create_table :appartments_and_regions do |t|
      t.belongs_to :appartment
      t.belongs_to :region
    end
    add_column :regions, :priority, :integer, default: 0
  end
end
