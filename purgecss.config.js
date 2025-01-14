module.exports = {
  content: ['*.html', '**/*.html', '*.js', '**/*.js'],
  css: ['*.css'],
  output: ['.'],
  dynamicAttributes: ['data-bs-theme', 'aria-expanded', 'data-bs-toggle', 'data-bs-popper'],
  safelist: [/day-2/, /day-3/, /show/, 'a', 'dropdown', 'dropdown-menu', 'dropdown-item', 'dropdown-toggle', 'nav-item', 'nav-link', 'me-lg-2'],
};
