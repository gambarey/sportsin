import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "input"]

  connect() {
    console.log(this.formTarget)
    console.log(this.inputTarget)
    console.log(this.listTarget)
  }

  update() {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        const list = document.querySelector("#list");
        console.log(list)
      })
  }
}
