// Import and register all your controllers from the importmap via controllers/**/*_controller
console.log(">>> USING THIS INDEX.JS <<<");

import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"

import GalleryCycleController from "./gallery_cycle_controller.js"
application.register("gallery-cycle", GalleryCycleController)

eagerLoadControllersFrom("controllers", application)