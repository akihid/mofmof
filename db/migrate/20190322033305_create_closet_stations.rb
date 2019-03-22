class CreateClosetStations < ActiveRecord::Migration[5.0]
  def change
    create_table :closet_stations do |t|
      t.integer :close_number, null: false
      t.string :route_name
      t.string :station_name
      t.integer :walikng_to_closest_station_minutes
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
