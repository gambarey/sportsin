import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="apply"
export default class extends Controller {
  static targets = ["sidePane", "accept", "reject", "status"]; // Add the new target
  static values = {
    id: Number,
  };
  connect() {
    console.log("hello from apply controller", this.sidePaneTargets);
    console.log(this.rejectTarget);
  }
  displayInfo(event) {
    //get offer index from event
    //get sidepane indexes
    this.sidePaneTargets.forEach((item) => item.classList.add("d-none"));
    let index = event.currentTarget.id;
    // @current_offer = this.
    this.sidePaneTargets[index].classList.remove("d-none");
  }

  update(event) {
    event.preventDefault();
    const url = "/applications/44?status=1";
    fetch(url, {
      method: "PATCH",
      headers: { Accept: "text/plain" },
    });
    // .then(response => response.text())
    // .then((data) => {
    //   this.side_paneTarget.outerHTML = data
    // })
  }

  accept() {
    const url = `/applications/${this.idValue}`;
    fetch(url, {
      method: "PATCH",
      body: new FormData(this.acceptTarget),
    });
    this.acceptTarget.classList.add("d-none");
    this.rejectTarget.classList.add("d-none");
    this.statusTarget.innerText = "ACCEPTED";
    this.statusTarget.classList.add("green-text");
  }

  reject() {
    const url = `/applications/${this.idValue}`;
    fetch(url, {
      method: "PATCH",
      body: new FormData(this.rejectTarget),
    });
    this.acceptTarget.classList.add("d-none");
    this.rejectTarget.classList.add("d-none");
    this.statusTarget.innerText = "REJECTED";
    this.statusTarget.classList.add("red-text");
  }
}
