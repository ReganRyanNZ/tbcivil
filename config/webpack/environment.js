const { environment } = require('@rails/webpacker')
const erb             = require('./loaders/erb')
const webpack         = require('webpack')

environment.loaders.append('erb', erb)

environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery'
  })
)

module.exports = environment