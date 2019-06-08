$(document).ready(() =>{
    $('a#addNote').on('click', displayNotesForm)
});
function displayNotesForm (evt){
    evt.preventDefault();

    $('#hiddenForm').show();

    // let noteStr = evt.target.value

    $('form').submit(function (e) {
        e.preventDefault();
        console.log('form submitted');
        // createNotesObj(e, NoteStr)
    });
}
function createNotesObj(){

}
