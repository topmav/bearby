import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Trigger the fade-in animation
    this.element.classList.add("flash-show")
    
    // Auto-remove after 3 seconds
    setTimeout(() => {
      this.element.classList.add("flash-hide")
    }, 3000)

    // Listen for page navigation
    document.addEventListener("turbo:before-render", this.cleanup)
  }

  disconnect() {
    // Clean up event listener
    document.removeEventListener("turbo:before-render", this.cleanup)
  }

  cleanup = () => {
    this.element.remove()
  }

  remove() {
    if (this.element.classList.contains("flash-hide")) {
      this.element.remove()
    }
  }
}
