require 'exifr/jpeg'

module ActiveStorage
  class Analyzer::ImageAnalyzer < Analyzer
    def metadata
      read_image do |image|
        if rotated_image?(image)
          { width: image.height, height: image.width }
        else
          { width: image.width, height: image.height }
        end.merge(gps_from_exif(image) || {}).merge(data_from_exif(image))
      end
    rescue LoadError
      logger.info "Skipping image analysis because the mini_magick gem isn't installed"
      {}
    end

    private

    def gps_from_exif(image)
      return unless image.type == 'JPEG'

      if exif = EXIFR::JPEG.new(image.path).exif
        if gps = exif.fields[:gps]
          {
            latitude:  gps.fields[:gps_latitude].to_f,
            longitude: gps.fields[:gps_longitude].to_f,
            altitude:  gps.fields[:gps_altitude].to_f,
            lat_ref:  gps.fields[:gps_latitude_ref].to_s,
            long_ref:  gps.fields[:gps_longitude_ref].to_s,
            camera_model:  exif.fields[:model].to_s,
            camera_make:  exif.fields[:make].to_s
          }
        end
      end
    rescue EXIFR::MalformedImage, EXIFR::MalformedJPEG
    end

    def data_from_exif(image)
      return unless image.type == 'JPEG'

      if exif = EXIFR::JPEG.new(image.path).exif
        if exif = exif.fields[:exif]
          {
            aperture_value:  exif.fields[:f_number].to_f,
            shutter_speed:  exif.fields[:exposure_time].to_s,
            ISO:  exif.fields[:iso_speed_ratings].to_f,
            original_date:  exif.fields[:date_time_digitized].to_s
          }
        end
      end
    rescue EXIFR::MalformedImage, EXIFR::MalformedJPEG
    end

  end
end
