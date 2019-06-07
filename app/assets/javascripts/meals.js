$(document).ready(() =>{
    $('a#addNote').click(function(evt, displayNotesForm){
        evt.preventDefault();
        $('#hiddenForm').show();
    });
});
function displayNotesForm (evt){
    evt.preventDefault();
    let noteStr = evt.target.value

    $('form').submit(function (e){
        createNotesObj(e, NoteStr)
    })
}
function createNotesObj(){

}
