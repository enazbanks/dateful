import { Controller } from "@hotwired/stimulus";
import { Popover } from "bootstrap/dist/js/bootstrap.bundle.js";

// Connects to data-controller="popover"
export default class extends Controller {
  connect() {
    console.log("Connect")
    this.popover = new Popover(this.element)
    // console.log(this.popover)
  }

  disconnect() {
    console.log("Disconnect")
    // console.log(this.popover)
    console.log(this.popover.tip)
    if (this.popover.tip) {
      this.popover.tip.remove()
    }
  }
}
