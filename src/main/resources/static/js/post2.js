document.addEventListener("DOMContentLoaded", function (evt) {

    let venue = document.querySelector("#venue");
    let venueName = document.querySelector("#privateVenueName");
    let checkbox = document.querySelector("#idPrivateVenue");

    venueName.style.visibility = "hidden";

    checkbox.addEventListener("click", function () {
        if($(this).is(":checked")){
            venue.style.visibility = "hidden";
            venueName.style.visibility = "visible";
        } else {
            venue.style.visibility = "visible";
            venueName.style.visibility = "hidden";
        }

    })

});