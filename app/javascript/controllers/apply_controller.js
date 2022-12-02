import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="apply"
export default class extends Controller {
  static targets = ["more_info_btn", "side_pane"] // Add the new target
  connect() {
    console.log("hello from apply controller")

  }
displayInfo() {
  // @current_offer = this.
}

  update(event) {
    // event.preventDefault()
    const url = this.more_info_btnTarget.action
    fetch(url, {
      method: "GET",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.more_info_btnTarget)
    })
      .then(response => response.text())
      .then((data) => {
        this.side_paneTarget.outerHTML = data
      })
  }

  createApplication() {
    const url = this.apply_btnTarget.action
    fetch(url, {
      method: "POST",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.apply_btnTarget)
    })
  }

}
