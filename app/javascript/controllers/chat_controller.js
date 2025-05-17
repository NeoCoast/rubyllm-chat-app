import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "messagesContainer", "message"]

  connect() {
    this.scrollToBottom()
  }
  
  handleKeyDown(event) {
    if (event.key === "Enter" && !event.shiftKey) {
      event.preventDefault()
      this.formTarget.requestSubmit()
      this.formTarget.reset()
    }
  }

  messageTargetConnected(target) {
    this.scrollToBottom()
  }

  scrollToBottom() {
    this.messagesContainerTarget.scrollTo({
      top: this.messagesContainerTarget.scrollHeight,
      behavior: "smooth"
    })
  }
} 