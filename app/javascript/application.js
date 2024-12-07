// Entry point for the build script in your package.json
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "./jquery"
import "./utilities/sorting"
import "./utilities/password_confirmation"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
import * as bootstrap from "bootstrap"
