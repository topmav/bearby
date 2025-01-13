import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["element", "checkbox"]

  connect() {
    this.toggle()
  }

  toggle() {
    const isChecked = this.checkboxTarget.checked
    this.elementTarget.classList.toggle("hidden", !isChecked)
  }
}
