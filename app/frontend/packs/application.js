import Rails from "@rails/ujs"
Rails.start()

import '../styles/application'
import '../scripts/alert_hide'
import '../scripts/map'

const images = require.context('../images', true)

import 'bootstrap/dist/js/bootstrap'
import 'lightbox2/dist/js/lightbox-plus-jquery'
