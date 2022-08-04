export function showBSToastMessages(bootstrap) {
    const toastElList = [].slice.call(document.querySelectorAll('.toast'))
    toastElList.map(function (toastEl) {
        return new bootstrap.Toast(toastEl).show()
    });
}