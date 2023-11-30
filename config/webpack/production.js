process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const { environment } = require('@rails/webpacker');
// const environment = require('./environment')

module.exports = environment.toWebpackConfig();
