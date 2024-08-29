import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hide-flash"
export default class extends Controller {
  connect() {
    console.log("I am workinggggg")
    setTimeout(() => {
      this.element.classList.add('d-none');
    }, 3000); // Hide after 3 seconds
  }
}
