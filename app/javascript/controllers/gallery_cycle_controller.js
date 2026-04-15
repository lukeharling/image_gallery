import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["image"]

  connect() {
    console.log("GalleryCycleController connected!", this.imageTargets.length)
    console.log("Targets found:", this.imageTargets)
    if (this.imageTargets.length <= 1) return

    this.index = 0
    this.startCycle()
  }

  startCycle() {
    this.interval = setInterval(() => {
      this.index = (this.index + 1) % this.imageTargets.length
      this.showImage(this.index)
    }, 2500) // change every 2.5 seconds
  }

  showImage(index) {
    console.log("Switching to image:", index)
    this.imageTargets.forEach((img, i) => {
      if (i === index) {
        img.classList.remove("opacity-0")
        img.classList.add("opacity-100")
      } else {
        img.classList.remove("opacity-100")
        img.classList.add("opacity-0")
      }
    })
  }

  disconnect() {
    clearInterval(this.interval)
  }
}