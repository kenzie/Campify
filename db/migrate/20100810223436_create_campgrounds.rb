class CreateCampgrounds < ActiveRecord::Migration
  def self.up
    create_table :campgrounds do |t|
      t.string :name
      t.string :subdomain
      t.string :street
      t.string :town
      t.string :postal_code
      t.references :region
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end

  def self.down
    drop_table :campgrounds
  end
end
