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

            
            showForm()
        });
    });
})

function showForm(id){
    $('#hiddenAdd-' + id).show();
    $('#hiddenAdd-' + id).click(function (evt) {
        evt.preventDefault();
        $('#formAdd-' + id).show();

        $(`#formAdd-${id} > form`).submit(function (evt) {
            evt.preventDefault();
            createIngredientObj(evt, id)
        });
    });
}
    function createIngredientObj(evt, id){
        evt.preventDefault();

        let value = $(`#formAdd-${id} > form`).serializeArray()
        
        console.log('value is ');
        console.log(value);

        $.post('/meals_ingredients', value, function(resp_obj) {

            const ingredient = new Ingredient(resp_obj);
            ingredient.showConfirmationMessage();

            // this is just to add the ingredient to the list
            const nameValue = value.filter(item => item.name === 'ingredient[name]');
            $(`#editForm-${id} ul`).append(`<li>${nameValue[0].value}</li>`);
            $('#formAdd-' + id).hide();   
    
        });
    }   


    class Ingredient {
        constructor(data) {
            this.id = data.id;
            this.name = data.name;
        }

        showConfirmationMessage() {
            window.alert('New ingredient added: ' + this.name);
        }
    }  

    

