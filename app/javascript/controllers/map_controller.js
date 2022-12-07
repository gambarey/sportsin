import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Object,
  };

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
console.log(this.markerValue)
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [this.markerValue.lng, this.markerValue.lat],
      zoom: 12,
    });
    // this.#addMarkerToMap();
    // this.#fitMapToMarkers();
  }

  // #addMarkerToMap() {
  //   new mapboxgl.Marker()
  //     .setLngLat([this.markerValue.lng, this.markerValue.lat])
  //     // .setPopup(popup)
  //     .addTo(this.map);
  // }

  // #fitMapToMarkers() {
  //   const bounds = new mapboxgl.LngLatBounds()
  //   this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
  //   this.map.fitBounds(bounds, { padding: 10, maxZoom: 25, duration: 0 })
  // }

  // onMapLoaded(event) {

  //   event.map.resize();

  // }
}
