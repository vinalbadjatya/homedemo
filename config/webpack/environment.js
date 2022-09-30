const { environment } = require('@rails/webpacker')
const webpack = require("webpack");
environment.plugins.append("provide", new webpack.Provideplugin({
    $: 'jquery',
    jquery: 'jquery'
})
)

module.exports = environment
