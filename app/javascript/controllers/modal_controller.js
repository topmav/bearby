import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]

  connect() {
    // Add event listener for ESC key to close modal
    document.addEventListener('keydown', this.handleKeydown.bind(this))
  }

  disconnect() {
    // Clean up event listener
    document.removeEventListener('keydown', this.handleKeydown.bind(this))
  }

  open() {
    this.containerTarget.classList.remove('hidden')
    document.body.classList.add('overflow-hidden')
  }

  close() {
    this.containerTarget.classList.add('hidden')
    document.body.classList.remove('overflow-hidden')
  }

  handleKeydown(event) {
    if (event.key === 'Escape') {
      this.close()
    }
  }

  // Close modal if clicking on the backdrop (outside modal content)
  closeBackground(event) {
    if (event.target === this.containerTarget) {
      this.close()
    }
  }
}
