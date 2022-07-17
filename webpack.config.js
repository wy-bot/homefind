const path = require('path');
const webpack = require('webpack');

module.exports = {
    mode: 'development',
    context: __dirname,
    entry: {
        app: './app.js'
    },
    output: {
        filename: 'apppp.js',
        path: path.resolve(__dirname,'dist'),
        sourcePrefix: ''
    },
    module: {
        rules: [
            {
                test: /\.(png|jpg|gif|svg)$/,
                loader: 'file-loader',
                options: {
                    name: 'images/[name].[ext]'
                }
            }
        ]
    },
    devServer: {
        port: 8818,
        open: true,
        static: path.join(__dirname, 'dist')
    },
    devtool: 'inline-source-map'
}