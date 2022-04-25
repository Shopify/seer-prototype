import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["minMagnitude", "likelyMagnitude", "maxMagnitude", "likelyMagnitudeOutput"]

  connect() {
    this.updateLikelyMagnitude()
  }

  updateLikelyMagnitude() {
    const min = this.minMagnitudeTarget
    const likely = this.likelyMagnitudeTarget
    const output = this.likelyMagnitudeOutputTarget
    const max = this.maxMagnitudeTarget

    likely.min = min.value
    likely.max = max.value
    output.value = likely.value
  }
}
