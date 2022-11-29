import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  // Inform the controller our inputs
  static targets = [ "date" ]

  connect() {
    flatpickr(this.dateTarget, {
      minDate: "today",
      maxDate: new Date().fp_incr(60)
    })
  }
}
