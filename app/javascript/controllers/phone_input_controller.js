import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.addEventListener('input', this.formatPhoneNumber.bind(this))
    this.element.addEventListener('keydown', this.preventNonNumeric.bind(this))
  }

  formatPhoneNumber(e) {
    let input = e.target
    let value = input.value.replace(/\D/g, '').substring(0, 10) // Remove non-digits and limit to 10 digits
    
    if (value.length > 0) {
      if (value.length <= 3) {
        value = `(${value}`
      } else if (value.length <= 6) {
        value = `(${value.slice(0, 3)}) ${value.slice(3)}`
      } else {
        value = `(${value.slice(0, 3)}) ${value.slice(3, 6)}-${value.slice(6)}`
      }
    }
    
    input.value = value
  }

  preventNonNumeric(e) {
    // Allow: backspace, delete, tab, escape, enter
    if ([46, 8, 9, 27, 13].indexOf(e.keyCode) !== -1 ||
      // Allow: Ctrl+A, Command+A
      (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) ||
      // Allow: home, end, left, right, down, up
      (e.keyCode >= 35 && e.keyCode <= 40)) {
      return
    }
    // Ensure that it is a number and stop the keypress if not
    if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
      e.preventDefault()
    }
  }
}
