const { environment } = require('@rails/webpacker')

module.exports = environment

environment.loaders.append('expose', { test: require.resolve('jquery'), use: { loader: 'expose-loader', options: '$' } })
