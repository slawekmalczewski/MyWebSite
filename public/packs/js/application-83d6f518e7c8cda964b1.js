!function(e){var t={};function n(o){if(t[o])return t[o].exports;var r=t[o]={i:o,l:!1,exports:{}};return e[o].call(r.exports,r,r.exports,n),r.l=!0,r.exports}n.m=e,n.c=t,n.d=function(e,t,o){n.o(e,t)||Object.defineProperty(e,t,{enumerable:!0,get:o})},n.r=function(e){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},n.t=function(e,t){if(1&t&&(e=n(e)),8&t)return e;if(4&t&&"object"===typeof e&&e&&e.__esModule)return e;var o=Object.create(null);if(n.r(o),Object.defineProperty(o,"default",{enumerable:!0,value:e}),2&t&&"string"!=typeof e)for(var r in e)n.d(o,r,function(t){return e[t]}.bind(null,r));return o},n.n=function(e){var t=e&&e.__esModule?function(){return e.default}:function(){return e};return n.d(t,"a",t),t},n.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)},n.p="/packs/",n(n.s=1)}([function(e,t){console.log("Hello Slawek Malczewski"),document.addEventListener("turbolinks:load",(function(){var e=new GMaps({div:"#map",lat:-12.043333,lng:-77.028333});window.map=e;var t=JSON.parse(document.querySelector("#map").dataset.photomarkers);window.photomarkers=t;var n=new google.maps.LatLngBounds;t.forEach((function(t){if(t.latitude&&t.longitude){var o=e.addMarker({lat:t.latitude,lng:t.longitude,title:t.myPhotoTitle,infoWindow:{content:"<p><a href='/photomarkers/".concat(t.id,"'>\n        ").concat(t.myPhotoTitle,"</a></p><br/>\n        ").concat(t.myPhotoDescription,"<br/>\n        ").concat(t.original_date_time,"<br/>\n        ").concat(t.address,"<br/>\n        ").concat(t.id,"<br/>\n        ")}});n.extend(o.position)}})),e.fitBounds(n)}))},function(e,t,n){console.log("Hello World from Webpacker"),n(0)}]);
//# sourceMappingURL=application-83d6f518e7c8cda964b1.js.map