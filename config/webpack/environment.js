const { environment } = require('@rails/webpacker')

module.exports = environment
<<<<<<< HEAD
=======

const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    "window.jQuery": "jquery",
    Popper: 'popper.js'
  })
)
>>>>>>> 7b7cd32db80680e48588a171d0b6432165fdcb95
