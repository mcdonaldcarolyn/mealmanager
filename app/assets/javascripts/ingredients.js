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

            $('#hiddenAdd-' + id).show();
            $('#hiddenAdd-' + id).click(function (evt) {
                evt.preventDefault();
                $('#formAdd-' + id).show();

                $(`#formAdd-${id} > form`).submit(function (evt) {
                    evt.preventDefault();
                    createIngredientObj(evt, id)
                });
            });
            function createIngredientObj(evt, id){
                evt.preventDefault();

                let value = $(`#formAdd-${id} > form`).serializeArray()
                
                console.log('value is ');
                console.log(value);

                $.ajax({
                    dataType: 'json',
                    method: 'POST',
                    url: '/meals_ingredients',
                    data: value,
                    success: function (){
                        const nameValue = value.filter(item => item.name === 'ingredient[name]');
                        $(`#editForm-${id} ul`).append(`<li>${nameValue[0].value}</li>`);
                        $('#formAdd-' + id).hide();   
                    }
                });
            }

        });
    });


 
});
    