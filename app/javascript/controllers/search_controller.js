import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  connect() {
    console.log('connected')
  }

  submit(_event) {
    this.element.requestSubmit()
    console.log('submit')
  }
}
