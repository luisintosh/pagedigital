import Compress from "compress.js"
import * as ActiveStorage from "@rails/activestorage"

ActiveStorage.start()

addEventListener('change', async (event) => {
    optimizeFileImageInputs(event)
})

async function optimizeFileImageInputs(event) {
    const inputFileMaps = {
        'page_profile[profile_image]': {maxWidth: 300, maxHeight: 300},
        'page_profile[header_image]': {maxWidth: 1920, maxHeight: 1920},
        'content_item[custom_thumbnail_image]': {maxWidth: 100, maxHeight: 100},
    }
    if (inputFileMaps[event.target.name]) {
        event.target.form.classList.add('loading-file-input');
        const files = [...event.target.files]
        const compress = new Compress();
        const imgData = await compress.compress(files, {
            size: 4,
            quality: 0.75,
            maxWidth: inputFileMaps[event.target.name].maxWidth,
            maxHeight: inputFileMaps[event.target.name].maxHeight,
            resize: true,
            rotate: false,
        })
        const {prefix, data, alt, ext} = imgData[0]
        const newFile = await urlToFile(`${prefix}${data}`, alt, ext)
        event.target.files = new FileListItems([newFile])
        event.target.form.classList.remove('loading-file-input');
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