const tt_main = `<i class="bi bi-clipboard"></i> Copy to clipboard`;
const tt_copied = `<i class="bi bi-clipboard-check"></i> Copy to clipboard`;

function copyToClipboard(e) {
    navigator.clipboard.writeText(e.target.innerText);
    const tt = bootstrap.Tooltip.getInstance(e.target);
    tt.setContent({ '.tooltip-inner': tt_copied })
}

window.addEventListener('load', function () {
    Array.from(document.getElementsByClassName('c2clip')).map(e => {
        e.addEventListener('click', copyToClipboard)
        const tt = new bootstrap.Tooltip(e, {
            boundary: document.body, html: true,
            title: tt_main
        })
        e.addEventListener('hidden.bs.tooltip', () => {
            tt.setContent({ '.tooltip-inner': tt_main })
        })

    });

});