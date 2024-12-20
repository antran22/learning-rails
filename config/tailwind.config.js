const defaultTheme = require("tailwindcss/defaultTheme");
const daisyTheme = require("daisyui/src/theming/themes");

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,haml,html,slim}",
  ],
  corePlugins: {
    preflight: true,
  },
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/container-queries"),
    require("tailwindcss-animate"),
    require("daisyui"),
  ],
  daisyui: {
    logs: false,
    themes: [
      {
        light: {
          ...daisyTheme["light"],
        },
      },
    ],
  },
};
