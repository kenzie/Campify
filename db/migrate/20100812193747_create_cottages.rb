class CreateCottages < ActiveRecord::Migration
  def self.up
    create_table :cottages do |t|
      t.integer :bedrooms
      t.integer :beds_king
      t.integer :beds_queen
      t.integer :beds_double
      t.integer :beds_single
      t.integer :beds_pullout
      t.float   :bathrooms
      t.boolean :kitchen
      t.boolean :satellite
      t.boolean :air_conditioning
      t.references :campground

      t.timestamps
    end
  end

  def self.down
    drop_table :cottages
  end
end
