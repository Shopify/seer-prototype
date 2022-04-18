// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "vega"
import "vega-lite"
import "vega-embed"

window.dispatchEvent(new Event("vega:load"))