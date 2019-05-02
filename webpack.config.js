const path = require('path')
const webpack = require('webpack')
const MiniCssExtractPlugin = require('mini-css-extract-plugin')
const ManifestPlugin = require('webpack-manifest-plugin')

module.exports = (env, argv) => {
  // const IS_DEV = argv.mode === 'development'

  return {
    entry: {
      app: './app/assets/entrypoint.js'
    },
    // devtool: IS_DEV ? 'source-map' : 'none',
    output: {
      filename: 'dist/javascripts/app-[hash].js',
      path: path.resolve(__dirname, 'public/assets')
    },
    plugins: [
      // new VueLoaderPlugin(),
      new MiniCssExtractPlugin({
        filename: 'dist/stylesheets/app-[hash].css'
      }),
      // new webpack.HotModuleReplacementPlugin(),
      new ManifestPlugin({
        writeToFileEmit: true
      }),
      new webpack.ProvidePlugin({
        $: 'jquery'
      })
    ],
    module: {
      rules: [
        {
          test: /\.js$/,
          exclude: /node_modules/,
          loader: 'babel-loader',
          options: {
            presets: [
              [
                '@babel/preset-env',
                {
                  targets: {
                    ie: 11
                  },
                  useBuiltIns: 'usage'
                }
              ]
            ]
          }
        },
        // {
        //   test: /\.vue$/,
        //   loader: 'vue-loader'
        // },
        {
          test: /\.(sa|sc|c)ss$/,
          use: [
            {
              loader: MiniCssExtractPlugin.loader,
              options: {
                publicPath: path.resolve(__dirname, 'public/assets/stylesheets')
              }
            },
            'css-loader',
            'sass-loader'
          ]
        },
        {
          test: /\.(jpg|png|gif)$/,
          loader: 'file-loader',
          options: {
            name: '[name]-[hash].[ext]',
            outputPath: 'images',
            publicPath: function(path) {
              return 'images/' + path
            }
          }
        }
      ]
    },
    resolve: {
      // alias: {
      //   vue: 'vue/dist/vue.js'
      // },
      extensions: [
        '.js',
        '.scss',
        'css',
        // '.vue',
        '.jpg',
        '.png',
        '.gif',
        ' '
      ]
    },
    optimization: {
      splitChunks: {
        cacheGroups: {
          vendor: {
            test: /.(c|sa)ss/,
            name: 'style',
            chunks: 'all',
            enforce: true
          }
        }
      }
    }
  }
}