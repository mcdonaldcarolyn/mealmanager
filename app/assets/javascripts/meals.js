$(document).ready(() =>{
    $('div#addNote').click(function(evt, displayNotesForm){
        evt.preventDefault();
        
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
