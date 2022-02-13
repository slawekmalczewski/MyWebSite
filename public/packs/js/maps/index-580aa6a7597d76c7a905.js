/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/maps/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/maps/index.js":
/*!********************************************!*\
  !*** ./app/javascript/packs/maps/index.js ***!
  \********************************************/
/*! no static exports found */
/***/ (function(module, exports) {

console.log("Hello Slawek Malczewski");
document.addEventListener("turbolinks:load", function () {
  var map = new GMaps({
    div: '#map',
    lat: -12.043333,
    lng: -77.028333
  });
  window.map = map;
  var photomarkers = JSON.parse(document.querySelector("#map").dataset.photomarkers);
  window.photomarkers = photomarkers;
  var bounds = new google.maps.LatLngBounds();
  photomarkers.forEach(function (photomarker) {
    if (photomarker.latitude && photomarker.longitude) {
      var marker = map.addMarker({
        lat: photomarker.latitude,
        lng: photomarker.longitude,
        title: photomarker.myPhotoTitle,
        infoWindow: {
          content: "\n        <h3><a href='".concat(photomarker.get_gallery_link, "' style=\"text-decoration: none;\">").concat(photomarker.get_gallery_title, "</a></h3>\n        <img src='").concat(photomarker.get_image_link, "' style=\"width:180px; height:auto; border: 1px solid #ddd; padding: 5px; margin-top:5px; margin-bottom:0px; margin-left:10px;\"><br/>\n        <h5 style=\"text-align:center;\">").concat(photomarker.myPhotoTitle, "</h5>\n        <p style=\"font-family: Arial, Sans-serif; font-size: 12px; color:rgb(77, 0, 0); line-height:16px;\">\n        Photo details</p>\n\n\n\n\n        <h3><a href='").concat(photomarker.get_image_link, "'>").concat(photomarker.myPhotoTitle, "</a></h3>\n        <img src='").concat(photomarker.get_image_link, "' style=\"width:150px; height:auto; border: 1px solid #ddd; padding: 5px; margin-bottom:8px; margin-top: 8px;\"><br/>\n        <h5>").concat(photomarker.myPhotoDescription, "</h5><br/><hr>\n        <p style=\"font-family: Arial, Sans-serif; font-size: 12px; color:rgb(77, 0, 0); line-height:16px;\">\n        ").concat("Aperture: " + photomarker.myPhotoAperture, "<br/>\n        ").concat("Shutter Speed: " + photomarker.myPhotoShutterSpeed, "<br/>\n        ").concat("ISO: " + photomarker.myPhotoISO, "<br/>\n        <a href='").concat(photomarker.get_gallery_link, "'>").concat(photomarker.get_gallery_title, "</a><br/>\n        ").concat(photomarker.original_date_time, "<br/></p>")
        }
      });
      bounds.extend(marker.position);
    }
  });
  map.fitBounds(bounds);
});

/***/ })

/******/ });
//# sourceMappingURL=index-580aa6a7597d76c7a905.js.map