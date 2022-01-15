class CreateWeatherStations < ActiveRecord::Migration[6.1]
  def change
    create_table :weather_stations do |t|

      t.timestamps
    end
  end
end
