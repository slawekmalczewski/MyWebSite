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
        content: `<h3><a href='/photomarkers/${photomarker.id}'>${photomarker.myPhotoTitle}</a></h3><br/>
        ${photomarker.myPhotoDescription}<br/>
        ${photomarker.original_date_time}<br/>
        ${photomarker.address}<br/>
        ${"photomarker id: " + photomarker.id}<br/>
        ${photomarker.moj_test}<br/>

        ${photomarker.myPhotoAperture}<br/>`
      }

    });
    bounds.extend(marker.position);
  }

});

  map.fitBounds(bounds);
});
