import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "minMagnitude", "likelyMagnitude", "maxMagnitude", "likelyMagnitudeOutput",
    "minFrequency", "likelyFrequency", "maxFrequency", "likelyFrequencyOutput",
  ]

  connect() {
    this.updateLikelyMagnitude()
    this.updateLikelyFrequency()
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

  updateLikelyFrequency() {
    const min = this.minFrequencyTarget
    const likely = this.likelyFrequencyTarget
    const output = this.likelyFrequencyOutputTarget
    const max = this.maxFrequencyTarget

    likely.min = min.value
    likely.max = max.value
    output.value = likely.value
  }
}
