function getFormData(formModal) {
    const title = formModal.albumForm.title
    const artist = formModal.albumForm.artist
    const year =  Number(formModal.albumForm.year)
    const genre = formModal.albumForm.genre

    const data= {title, artist, year, genre}
    return data
}

function getRecords(fileio) {
    let data = fileio.text
    if (data) {
        data = JSON.parse(data)
    } else {
        data = []
    }
    return data
}

function saveDocument(fileio, formModal, model, toast) {
    const data = getRecords(fileio)
    const newRecord = getFormData(formModal)
    data.push(newRecord)
    fileio.text = JSON.stringify(data, null, 4)
    fileio.write()
    toast.show("Album successfully added!", 3000);
    formModal.close()
    model.insert(0, newRecord)
}

function populateListModel(fileio, model) {
    const albumsArray = Scripts.getRecords(fileio)
    albumsArray.forEach((album) => {
                            model.append(album)
                        })
}

