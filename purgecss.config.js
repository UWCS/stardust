module.exports = {
  content: ['*.html', '**/*.html', '*.js', '**/*.js'],
  css: ['*.css'],
  output: ['.'],
  dynamicAttributes: ["data-bs-theme", "aria-expanded"],
  safelist: [/day-2/, /day-3/],
  whitelistPatterns: [/show/]
}