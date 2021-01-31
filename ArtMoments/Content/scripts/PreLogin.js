var left = document.getElementById("left");
var right = document.getElementById("right");
var container = document.getElementById("container");


left.addEventListener("mouseenter", function () {

    container.classList.add("hover-left");


});


left.addEventListener("mouseleave", function () {

    container.classList.remove("hover-left");

});

right.addEventListener("mouseenter", function () {

    container.classList.add("hover-right");


});

right.addEventListener("mouseleave", function () {

    container.classList.remove("hover-right");


});





