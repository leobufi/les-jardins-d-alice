const { environment } = require('@rails/webpacker');
const CompressionPlugin = require('compression-webpack-plugin');


// Preventing Babel from transpiling NodeModules packages
environment.loaders.delete('nodeModules');
environment.plugins.append('CompressionPlugin', new CompressionPlugin());

module.exports = environment
