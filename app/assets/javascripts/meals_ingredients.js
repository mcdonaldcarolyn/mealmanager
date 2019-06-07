$(document).ready(()=>{
    console.log("hello");
   
    $('a#editMeal').click(function (evt) {
        evt.preventDefault();
        const id = evt.target.getAttribute('data-meal-id');
        $.get('/meals_json/' + id, function(ingredients) {
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


 
})
    


//    $('/meals_json/:id').on('click', (e)=>{
//      e.preventDefault();
//    })
   
  //     $( '@meals_ingredients', {
//             success: function (data) {
//                 console.log(data);
//             },
//             error: function (err) {
//                 console.error('error: ' + err);
//             }
//         });
//     });
// })
