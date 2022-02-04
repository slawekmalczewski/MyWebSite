module PhotoGalleriesHelper

  def sort_gallery_by_photo_position(gallery)
    gallery.sort_by { |a| a.myPhotoPosition }
  end

  def display_weather_icon(gallery)
    @weather_city = gallery.country
    @weather_results = WeatherStation.search(@weather_city)
    @result = (image_tag ('https:' + @weather_results['current']['condition']['icon']), style: 'height:2rem;width:auto;')
  end

end
