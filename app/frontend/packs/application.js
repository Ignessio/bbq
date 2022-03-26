import Rails from "@rails/ujs"
Rails.start()

import '../styles/application'
import '../scripts/alert_hide'
const images = require.context('../../frontend/images', true)
const imagePath = name => images(name, true)

import 'bootstrap/dist/js/bootstrap'
