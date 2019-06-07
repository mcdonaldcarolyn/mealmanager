$(document).ready(() =>{
    console.log("ingredients.js");
   
    $('a#editMeal').click(function (evt) {
        evt.preventDefault();
        const id = evt.target.getAttribute('data-meal-id');
        $.get('/meals/' + id + '/ingredients.json', function(ingredients) {
            console.log(ingredients);
            let htmlStr = '<ul>';

            for (let i = 0; i < ingredients.length; i++) {
                const ingredient = ingredients[i];
                htmlStr = htmlStr + '<li>' + ingredient.name + '</li>';
            }

            htmlStr += '</ul>';

            $('#editForm-' + id).html(htmlStr);

            

        });
    });


 
});
    