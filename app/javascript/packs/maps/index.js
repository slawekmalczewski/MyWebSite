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
        content: `
        <h3><a href='${photomarker.get_gallery_link}' style="text-decoration: none; color:black; font-weight:bold;">${photomarker.get_gallery_title}</a></h3>
        <img src='${photomarker.get_image_link}' style="width:180px; height:auto; border: 1px solid #ddd; padding: 5px; margin-top:5px; margin-bottom:0px; margin-left:10px;"><br/>
        <h5>${photomarker.myPhotoTitle}</h5>
        <hr style="height:1px;border-width:0;color:gray;background-color:gray">
        <p style="font-family: Arial, Sans-serif; font-size: 0.80rem; color:rgb(77, 0, 0); line-height:1.2rem;">
        Photo details:</p>
        <p style="font-family: Arial, Sans-serif; font-size: 0.70rem; color:rgb(77, 0, 0); line-height:1.05rem;">
        ${"Aperture: " + photomarker.myPhotoAperture}<br/>
        ${"Shutter Speed: " + photomarker.myPhotoShutterSpeed}<br/>
        ${"ISO: " + photomarker.myPhotoISO}<br/>
        ${"Timestamp: " + photomarker.original_date_time}<br/>
        </p>
        <hr style="height:1px;border-width:0;color:gray;background-color:gray">
        <p style="font-family: Arial, Sans-serif; font-size: 0.80rem; color:rgb(77, 0, 0); line-height:1.2rem;">
        Image File: <a href='${photomarker.get_image_link}'>Image Link</a></p>`
      }

    });
    bounds.extend(marker.position);
  }

});

  map.fitBounds(bounds);
});
