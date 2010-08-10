class CreateReservations < ActiveRecord::Migration
  def self.up
    create_table :reservations do |t|
      t.date :arrival_at
      t.date :departure_at
      t.references :campsite
      t.references :vehicle

      t.timestamps
    end
  end

  def self.down
    drop_table :reservations
  end
end
