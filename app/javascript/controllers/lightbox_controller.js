import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["overlay", "image"]
  static values = { images: Array, index: Number }

  connect() {
    console.log("Lightbox controller connected")
  }

  open(event) {
    event.preventDefault()
    const url = event.currentTarget.dataset.fullsize
    const index = parseInt(event.currentTarget.dataset.index)

    this.indexValue = index
    this.showImage(url)

    this.overlayTarget.style.display = "block"
    this.startSlideshow()
  }

  close() {
    this.overlayTarget.style.display = "none"
    this.imageTarget.src = ""
    this.stopSlideshow()
  }

  startSlideshow() {
    this.stopSlideshow()
    this.timer = setInterval(() => this.next(), 3000)
  }

  stopSlideshow() {
    if (this.timer) clearInterval(this.timer)
  }

  showImage(url) {
    this.imageTarget.src = url
  }

  next() {
    this.indexValue = (this.indexValue + 1) % this.imagesValue.length
    this.showImage(this.imagesValue[this.indexValue])
  }

  prev() {
    this.indexValue =
      (this.indexValue - 1 + this.imagesValue.length) % this.imagesValue.length
    this.showImage(this.imagesValue[this.indexValue])
  }
}