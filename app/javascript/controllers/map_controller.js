import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Object,
  };

  connect() {
    console.log(this.markerValue);
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
    });
    this.#addMarkerToMap();
  }

  #addMarkerToMap() {
    new mapboxgl.Marker()
      .setLngLat([this.markerValue.lng, this.markerValue.lat])
      // .setPopup(popup)
      .addTo(this.map);
  }
}
