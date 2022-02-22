module.exports = {
  content: [
    "./index.html",
    "./src/**/*.{vue,js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
        height: {
            "116": "30.5rem",
        },
        colors: {
            "primary-dark": "#18181c",
        },
        border: {
            "1": "1px solid white",
        },
    },
  },
  plugins: [],
}