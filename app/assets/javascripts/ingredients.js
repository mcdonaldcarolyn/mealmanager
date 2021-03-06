
// $(document).ready(() => {
//     addIngredientListClickListener();
//     addIngredientFormClicklistener();
//     addIngredientShowClickListener();
// });

$(document).on('turbolinks:load', () => {
    addIngredientListClickListener();
    addIngredientFormClicklistener();
    addIngredientShowClickListener();
});

function addIngredientListClickListener() {
    console.log("ingredients.js");
    $('a#ingredientShow').click(showIngredientClick);
}

function showIngredientClick(evt) {
    evt.preventDefault();
    const id = evt.target.getAttribute('data-meal-id');
    $.get('/meals/' + id + '/ingredients.json', function (ingredients) {
        console.log(ingredients);
        showIngredients(id, ingredients);
        //showForm(id);
    });
}

function showIngredients(id, ingredients) {
    let htmlStr = '<ul>';

    for (let i = 0; i < ingredients.length; i++) {
        const ingredient = ingredients[i];
        htmlStr = htmlStr + '<li>' + ingredient.name + '</li>';
    }

    htmlStr += '</ul>';

    $('#ingredientForm-' + id).html(htmlStr);
}
function addIngredientFormClicklistener(){
    $('a#ingredientAdd').click(function (evt) {
        evt.preventDefault();
        const id = evt.target.getAttribute('data-meal-id');
        $('#formAdd-' + id).show();

        $(`#formAdd-${id} > form`).submit(function (evt) {
            evt.preventDefault();
            createIngredientObj(evt, id)
        });
    });
   
    //console.log(id)

}
function showForm(evt){
    evt.preventDefault();
    const id = evt.target.getAttribute('data-meal-id');
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

    let value = $(`#formAdd-${id} > form`).serializeArray();
    
    console.log('value is ');
    console.log(value);

    $.post('/meals_ingredients.json', value, function(resp_obj) {

        const ingredient = new Ingredient(resp_obj);
        ingredient.showConfirmationMessage();
        ingredient.addIngerdToList(id);
      
        // const nameValue = value.filter(item => item.name === 'ingredient[name]');
        // $(`#ingredientForm-${id} ul`).append(`<li>${nameValue[0].value}</li>`);
         $('#formAdd-' + id).hide();   

    });
}   




class Ingredient {
    constructor(data) {
        this.id = data.id;
        this.name = data.name;
    }
    addIngerdToList(mealId){
         $(`#ingredientForm-${mealId} ul`).append(`<li>${this.name}</li>`);
    }
    showConfirmationMessage() {
        window.alert('New ingredient added: ' + this.name);
    }
}  
  
function addIngredientShowClickListener() {
    $('a#ingredientName').click(ingredientNameClick);

} 
function ingredientNameClick(evt){
    evt.preventDefault();
    const id = evt.target.getAttribute('data-ingredient-id');
    $.get(`/ingredients/${id}.json`, function(ingredient) {
        showMeals(ingredient, id);
        
    });
}

function showMeals(ingredient, id){
    console.log(ingredient);
    let htmlStr = '<ul>';
    for (let i = 0; i < ingredient.meals.length; i++) {
        const meal = ingredient.meals[i];
        htmlStr = htmlStr + '<li>' + meal.title + '</li>';
    }
    htmlStr += '</ul>';
    $('#ingredientName-' + id).html(htmlStr);
}

