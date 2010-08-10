class CreateCampsites < ActiveRecord::Migration
  def self.up
    create_table :campsites do |t|
      t.integer :length
      t.integer :width
      t.integer :amps
      t.boolean :water
      t.boolean :sewer
      t.boolean :cable
      t.references :campground

      t.timestamps
    end
  end

  def self.down
    drop_table :campsites
  end
end
