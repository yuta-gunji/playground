module.exports = {
  purge: ['./public/**/*.html'],
  theme: {
    extend: {
      spacing: {
        //px 単位
        ...[...Array(120)].reduce((m, _, i) => {
          m[`${i}px`] = `${i}px`
          return m
        }, {}),
      },
    },
  },
  variants: {
    margin: ['responsive', 'first', 'last'],
  },
  plugins: [],
}
