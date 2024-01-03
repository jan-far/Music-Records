function getFormData(formFields) {
    const cdTitle = formFields.title
    const artistName = formFields.artist
    const year =  Number(formFields.year)
    const genre = formFields.genre

    const data= {cdTitle, artistName, year, genre}
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

function saveDocument(fileio, formFields, model, toast) {
    const data = getRecords(fileio)
    const newRecord = getFormData(formFields)
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

