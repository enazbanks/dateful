// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

import { initFlatpickr } from "./plugins/flatpickr";

document.addEventListener('turbo:load', (e) => {
  initFlatpickr();
})
