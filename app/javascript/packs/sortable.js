import Sortable from 'sortablejs'

document.addEventListener("turbo:load", function() {
    const el = document.getElementById('page_content_items')
    if (el) {
        Sortable.create(
            el,
            {
                handle: '.content-item-move-icon',
                easing: 'cubic-bezier(1, 0, 0, 1)',
                ghostClass: 'sortable-ghost',
                onUpdate: (event) => {
                    // console.log(event);
                    const element = event.item;
                    const elementHandler = element.querySelector('.content-item-move-icon');
                    const pathToUpdate = elementHandler.dataset.reorderHref;
                    if (pathToUpdate) {
                        // console.log(pathToUpdate);
                        const csrfToken = document.querySelector('meta[name=csrf-token]')?.content;
                        const headers = {'X-CSRF-Token': csrfToken, 'Content-Type': 'application/json'}
                        const body = JSON.stringify({destination: event.newIndex});
                        fetch(pathToUpdate, {method: 'PATCH', headers, body}).catch(console.error);
                    }
                }
            }
        )
    }
})
