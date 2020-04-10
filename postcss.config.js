module.exports = (ctx) => ({
  map: ctx.options.map,
  parser: ctx.file.extname === '.sss' ? 'sugarss' : false,
  plugins: {
    'tailwindcss': true,
    cssnano: ctx.env === 'production' ? {} : false,
  },
})
