document.addEventListener("DOMContentLoaded", function (evt) {

    let venue = document.querySelector("#venue");
    let venueName = document.querySelector("#privateVenueName");
    let checkbox = document.querySelector("#idPrivateVenue");

    venueName.style.display = "none";

    checkbox.addEventListener("click", function () {
        if($(this).is(":checked")){
            venue.style.display = "none";
            venueName.style.display = "block";
        } else {
            venue.style.display = "block";
            venueName.style.display = "none";
        }

    })

});