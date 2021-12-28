// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import mrujs from "mrujs"
import * as Turbo from "@hotwired/turbo";
import $ from 'jquery'
// import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from "bootstrap"

window.Turbo = Turbo;
mrujs.start();
