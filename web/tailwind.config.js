module.exports = {
  content: [
    "./index.html",
    "./src/**/*.{vue,js,jsx}",
  ],
  theme: {
    extend: {
      screens: {
        'cs': '1024px',
        'cm': '1800px',
        'cl': '2100px'
      },
      minHeight: {
        '116': '29.5rem',
        'cs': '35.0rem',
        'cm': '30.5rem',
        'cl': '31.5rem'
      },
      maxHeight: {
        '116': '29.5rem',
        'cs': '32.0rem',
        'cm': '34.5rem',
        'cl': '40.5rem'
      },
      height: {
          "116": "30.0rem",
      },
      colors: {
          "primary-dark": "#18181c",
      },
      border: {
          "1": "1px solid white",
      },
      fontSize: {
        "custom": "1.5rem",
        "custom-2": "1.15rem",
      },
      width: {
        "custom": "19.5rem",
        "90%": "90%",
      },
    },
  },
  plugins: [],
}