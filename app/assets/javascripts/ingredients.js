

window.addEventListener('DOMContentLoaded', (event) => {
    // change this to the route in your controller to return json
    fetch('/ingredients/getsomething')
        .then(resp => resp.json)
        .then(ingredients => {
            // confirm on index ingredients that this is in devtools console
            console.log(ingredients);

            // select a div on the page <div id="ingredients"></div>
            const ingredientsDiv = document.querySelector('#ingredients');

            // inserting stuff into the dom
            ingredients.forEach(ingredient => {
                // insert new element into ingredientsDiv
                const newDiv = document.createElement('div');
                ingredientsDiv.append(newDiv);
            });
        });  
});

