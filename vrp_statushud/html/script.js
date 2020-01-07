$(function(){
    window.addEventListener("message", function(event){
        if (event.data.pauseMenu == false) {
            $(".ui").fadeIn();
            var health = event.data.health;
            $("#health-percent").html(Math.round(health) + "%");
            $("#health-level").css("width", health + "%");
            var armor = event.data.armor;
            $("#armor-percent").html(Math.round(armor) + "%");
            $("#armor-level").css("width", armor + "%");
            var food = event.data.food;
            $("#food-percent").html(Math.round(food) + "%");
            $("#food-level").css("width", food + "%");
            var water = event.data.water;
            $("#water-percent").html(Math.round(water) + "%");
            $("#water-level").css("width", water + "%");
        } else {
            $(".ui").fadeOut();
        }
    })
})