BASE_URL_FOR_CURRENT_WEATHER = "http://api.weatherapi.com/v1/current.json?key="
API_PARTIAL_URL_FOR_CURRENT_WEATHER = "&q="


class WeatherStation < ApplicationRecord
  attr_reader :results

  def self.search(city)
    @weather_results = HTTParty.get(BASE_URL_FOR_CURRENT_WEATHER + "#{Rails.application.credentials.dig(:WEATHER_API_KEY)}" + API_PARTIAL_URL_FOR_CURRENT_WEATHER + "#{city}")
    @weather_results
  end
end
