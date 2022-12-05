import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="apply"
export default class extends Controller {
  static targets = ["sidePane"] // Add the new target
  connect() {
    console.log("hello from apply controller", this.sidePaneTargets)

  }
displayInfo(event) {
  //get offer index from event
  //get sidepane indexes
  this.sidePaneTargets.forEach(item => item.classList.add("d-none"));
 let index = event.currentTarget.id
  // @current_offer = this.
  this.sidePaneTargets[index].classList.remove("d-none")
}

  // update(event) {
  //   // event.preventDefault()
  //   const url = this.more_info_btnTarget.action
  //   fetch(url, {
  //     method: "GET",
  //     headers: { "Accept": "text/plain" },
  //     body: new FormData(this.side_paneTarget)
  //   })
  //     .then(response => response.text())
  //     .then((data) => {
  //       this.side_paneTarget.outerHTML = data
  //     })
  // }

  createApplication() {
    const url = this.apply_btnTarget.action
    fetch(url, {
      method: "POST",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.apply_btnTarget)
    })
  }

}
