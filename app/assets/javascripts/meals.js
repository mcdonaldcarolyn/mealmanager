$(document).ready(()=>{
    console.log()
    
    
    $('a#editMeal').on('click', (e)=>{
        e.preventDefault();

        $('@meals_ingredients', {
            success: function (data) {
                console.log(data);
            },
            error: function (err) {
                console.error('error: ' + err);
            }
        });
    });

    
})

