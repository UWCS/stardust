module.exports = {
  content: ['*.html', '**/*.html', '*.js', '**/*.js'],
  css: ['*.css'],
  output: ['.'],
  dynamicAttributes: ["data-bs-theme", "aria-expanded", "data-bs-toggle"],
  safelist: [
    "dropdown", "dropdown-menu", "dropdown-item", "dropdown-toggle",
    "nav-item", "nav-link", "me-lg-2",
    { pattern: /^a\[href\^="https:\/\/"\]:not\(/ },
    { pattern: /day-\d/ },
  ]
};
