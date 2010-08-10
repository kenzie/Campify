class CreateRegions < ActiveRecord::Migration
  def self.up
    create_table :regions do |t|
      t.string :name
      t.string :abbr
      t.references :region

      t.timestamps
    end
  end

  def self.down
    drop_table :regions
  end
end
