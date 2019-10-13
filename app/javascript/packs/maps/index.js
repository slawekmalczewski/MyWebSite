console.log("Hello Slawek Malczewski")

  document.addEventListener("turbolinks:load", function(){
    var map = new GMaps({
    div: '#map',
    lat: -12.043333,
    lng: -77.028333
  });

  window.map = map;

var photomarkers = JSON.parse(document.querySelector("#map").dataset.photomarkers);
window.photomarkers = photomarkers;

var bounds = new google.maps.LatLngBounds();


photomarkers.forEach(function(photomarker){
  if (photomarker.latitude && photomarker.longitude){
    var marker = map.addMarker({
      lat: photomarker.latitude,
      lng: photomarker.longitude,
      title: photomarker.myPhotoTitle,
      infoWindow:{
        content: `<h3><a href='${photomarker.get_image_link}'>${photomarker.myPhotoTitle}</a></h3>
        <img src='${photomarker.get_image_link}' style="width:150px; height:auto; border: 1px solid #ddd; padding: 5px; margin-bottom:8px; margin-top: 8px;"><br/>
        <h5>${photomarker.myPhotoDescription}</h5><br/><hr>
        <p style="font-family: Arial, Sans-serif; font-size: 12px; color:rgb(77, 0, 0); line-height:16px;">
        ${"Aperture: " + photomarker.myPhotoAperture}<br/>
        ${"Shutter Speed: " + photomarker.myPhotoShutterSpeed}<br/>
        ${"ISO: " + photomarker.myPhotoISO}<br/>
        ${photomarker.original_date_time}<br/></p>`
      }

    });
    bounds.extend(marker.position);
  }

});

  map.fitBounds(bounds);
});
