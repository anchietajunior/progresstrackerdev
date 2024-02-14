const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        'ptblue': '#3468C0',
        'ptlblue': '#86A7FC',
        'ptorange': '#FF9843',
        'ptpurple': '#7F27FF',
        'ptorange': '#FF8911',
        'ptlpurple': '#9F70FD',
        'pltorange': '#FDBF60',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
    ({ addVariant }) => {
      addVariant("turbo-native", "html[data-turbo-native] &"),
        addVariant('non-turbo-native', "html:not([data-turbo-native]) &")
    }
  ]
}
