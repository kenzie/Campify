class CreateVehicles < ActiveRecord::Migration
  def self.up
    create_table :vehicles do |t|
      t.integer :length
      t.integer :width
      t.integer :amps
      t.boolean :water
      t.boolean :sewer
      t.boolean :cable

      t.timestamps
    end
  end

  def self.down
    drop_table :vehicles
  end
end
