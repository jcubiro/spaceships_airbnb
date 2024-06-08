// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

import { Turbo } from "@hotwired/turbo-rails"
import "controllers"

import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"

document.addEventListener("turbo:load", () => {
  flatpickr(".flatpickr", {})
})
