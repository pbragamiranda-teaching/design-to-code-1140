import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-movie"
export default class extends Controller {
  static targets = ["form", "info", "card"]

  // connect() {
  //   // console.log(this.formTarget, this.infoTarget)
  // }

  displayForm() {
    this.infoTarget.classList.add("d-none")
    this.formTarget.classList.remove("d-none")
  }

  update(event) {
    event.preventDefault()
    const url = this.formTarget.action
    fetch(url, 
      { headers: { "Accept": "text/plain" },
        method: "PATCH",
        body:  new FormData(this.formTarget) })
      .then(response => response.text())
      .then((data) => {
        this.cardTarget.outerHTML = data
      })
  }
}
