const dark = function () {
    const curr_light = localStorage.getItem("dark_mode") == "light";
    document.documentElement.setAttribute('data-bs-theme', curr_light ? "light" : "dark");
}

dark();

// Set toggle button on load
window.addEventListener('load', function () {
    document.getElementById('dark-mode').addEventListener('click', () => {
        const curr_light = localStorage.getItem("dark_mode") == "light";
        localStorage.setItem("dark_mode", !curr_light ? "light" : "dark");
        dark();
    });
});
