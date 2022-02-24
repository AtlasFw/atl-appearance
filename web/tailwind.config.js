module.exports = {
  content: [
    "./index.html",
    "./src/**/*.{vue,js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
        minHeight: {
          '116': '29.5rem',
        },
        maxHeight: {
          '116': '30.0rem',
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
        },
        width: {
          "90%": "90%",
        },
    },
  },
  plugins: [],
}