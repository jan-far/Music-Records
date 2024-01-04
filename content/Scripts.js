function getFormData(formFields) {
    const cdTitle = formFields.title
    const artistName = formFields.artist
    const year =  Number(formFields.year)
    const genre = formFields.genre
    const songs = formFields.songs.split(',')

    const data= {cdTitle, artistName, year, genre, songs}
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
    newRecord.songs = newRecord.songs.map(song => ({song: song.trim()}))
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
                            console.log("rec: ", JSON.stringify(album))
                        })
}


function calcMin(mainValue, firstValue, secondValue) {
    return mainValue > firstValue ? firstValue : mainValue < secondValue ? secondValue : mainValue
}

function getInitials(model, key = "cdTitle") {
    const initials = []
    const alphabets = generateLetters()
    for (let i = 0; i < model.count; i++) {
        const letter = model.get(i)[key][0].toUpperCase()
        initials.push(letter)
    }
    const aval = alphabets.map(a => {
                                   if (initials.indexOf(a) !== -1)  {
                                       return ({letter: a, exists: true})
                                   } else {
                                       return ({letter: a, exists: false})
                                   }}
                               )
    return aval
}

function generateLetters() {
    const alpha = Array.from(Array(26)).map((e, i) => i + 65);
    const alphabet = alpha.map((x) => String.fromCharCode(x));
    return alphabet
}

function getThemeGradient(mouseArea, button) {
    return  lightMode ?
                mouseArea.containsMouse ?
                    Constants.lightContainerHover:
                    Constants.lightContainerDefault
    :mouseArea.containsMouse ?
         Constants.darkContainerHover :
         Constants.darkContainerDefault

}

