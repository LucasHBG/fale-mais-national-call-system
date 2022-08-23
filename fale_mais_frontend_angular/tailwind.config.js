module.exports = {
  content: ["./src/**/*.{html,ts}"],
  theme: {
    extend: {},
  },
  variants: {},
  plugins: [
    require("@tailwindcss/typography"),
    require("@tailwindcss/forms"),
    // add daisyUI plugin
    require("daisyui"),
  ],

  // daisyUI config (optional)
  daisyui: {
    styled: true,
    themes: ["dracula"],
    base: true,
    utils: true,
    logs: true,
    rtl: false,
    prefix: "",
    darkTheme: "dark",
  },
  darkMode: "class",
};
