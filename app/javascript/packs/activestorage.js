import Compress from "compress.js"
import * as ActiveStorage from "@rails/activestorage"

ActiveStorage.start()

addEventListener('change', async (event) => {
    optimizeFileImageInputs(event)
})

async function optimizeFileImageInputs(event) {
    const optimizeInputs = ['page_profile[profile_image]', 'page_profile[header_image]', 'content_item[custom_thumbnail_image]']
    if (optimizeInputs.includes(event.target.name)) {
        // event.target.form
        const files = [...event.target.files]
        const compress = new Compress();
        const imgData = await compress.compress(files, {
            size: 4,
            quality: 0.75,
            maxWidth: 1920,
            maxHeight: 1920,
            resize: true,
            rotate: false,
        })
        const {prefix, data, alt, ext} = imgData[0]
        const newFile = await urlToFile(`${prefix}${data}`, alt, ext)
        event.target.files = new FileListItems([newFile])
    }
}

async function urlToFile(url, filename, mimeType) {
    const res = await fetch(url)
    const buf = await res.arrayBuffer()
    return new File([buf], filename, {type: mimeType})
}

function FileListItems(files) {
    const b = new ClipboardEvent("").clipboardData || new DataTransfer()
    for (let i = 0, len = files.length; i < len; i++) b.items.add(files[i])
    return b.files
}