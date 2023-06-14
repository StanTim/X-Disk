import Rails from "@rails/ujs"
Rails.start()

import "../styles/app.scss"
import "bootstrap/dist/js/bootstrap"

const images = require.context("../images", true)

// require("jquery")
