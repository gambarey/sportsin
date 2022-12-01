import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="apply"
export default class extends Controller {
  connect() {
    console.log("hello from apply controller")
  
  }
}
