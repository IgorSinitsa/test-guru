// Entry point for the build script in your package.json
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "./jquery"
import "./utilities/sorting"
import "./utilities/password_confirmation"
import "./utilities/form_inline"
import "./utilities/progress_bar"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
import * as bootstrap from "bootstrap"
