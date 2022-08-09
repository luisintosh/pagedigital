// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import * as bootstrap from "bootstrap"
window.bootstrap = bootstrap;

import "./packs/activestorage"
import "./packs/sortable"
import "./packs/animation_globe"
import { showBSToastMessages } from "./packs/toastmessage"
import "./controllers"

document.addEventListener('turbo:load', function () {
    showBSToastMessages(window.bootstrap);
})