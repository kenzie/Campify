class CreateReservations < ActiveRecord::Migration
  def self.up
    create_table :reservations do |t|
      t.date :arrival_at
      t.date :departure_at
      t.references :campground
      t.references :bookable, :polymorphic => true
      t.references :bookee, :polymorphic => true

      t.timestamps
    end
  end

  def self.down
    drop_table :reservations
  end
end
