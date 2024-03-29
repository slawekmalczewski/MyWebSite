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
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/applicationwebpacker.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/applicationwebpacker.js":
/*!******************************************************!*\
  !*** ./app/javascript/packs/applicationwebpacker.js ***!
  \******************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
console.log('Hello World - if you can see this message it means that WEBPACKER is loading correctly');

__webpack_require__(/*! ./maps */ "./app/javascript/packs/maps/index.js");

/***/ }),

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
          content: "\n        <h3><a href='".concat(photomarker.get_gallery_link, "' style=\"text-decoration: none;\">").concat(photomarker.get_gallery_title, "</a></h3>\n        <img src='").concat(photomarker.get_image_link, "' style=\"width:150px; height:auto; border: 1px solid #ddd; padding: 5px; margin: 5px 50% 5px 50%;\"><br/>\n\n\n\n\n        <h3><a href='").concat(photomarker.get_image_link, "'>").concat(photomarker.myPhotoTitle, "</a></h3>\n        <img src='").concat(photomarker.get_image_link, "' style=\"width:150px; height:auto; border: 1px solid #ddd; padding: 5px; margin-bottom:8px; margin-top: 8px;\"><br/>\n        <h5>").concat(photomarker.myPhotoDescription, "</h5><br/><hr>\n        <p style=\"font-family: Arial, Sans-serif; font-size: 12px; color:rgb(77, 0, 0); line-height:16px;\">\n        ").concat("Aperture: " + photomarker.myPhotoAperture, "<br/>\n        ").concat("Shutter Speed: " + photomarker.myPhotoShutterSpeed, "<br/>\n        ").concat("ISO: " + photomarker.myPhotoISO, "<br/>\n        <a href='").concat(photomarker.get_gallery_link, "'>").concat(photomarker.get_gallery_title, "</a><br/>\n        ").concat(photomarker.original_date_time, "<br/></p>")
        }
      });
      bounds.extend(marker.position);
    }
  });
  map.fitBounds(bounds);
});

/***/ })

/******/ });
//# sourceMappingURL=applicationwebpacker-357af47e9f28b71b6976.js.map