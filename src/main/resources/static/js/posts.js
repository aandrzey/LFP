$(document).ready(function () {

    //let pageLinks = $(".page-link");
    let nextLi = $(".next");
    let previousLi = $('.previous');
    let activeLi = $('.page-item.active');
    let previousSiblingActive = activeLi.prev();
    let nextSiblingActive = activeLi.next();

    if (previousLi.is(previousSiblingActive)) {
        previousLi.addClass('disabled');
        previousLi.children().eq(0).attr('tabindex', '-1');
    } else {
        previousLi.removeClass("disabled");
        previousLi.children().eq(0).removeAttr("tabindex");
    }

    if (nextLi.is(nextSiblingActive)) {
        nextLi.addClass('disabled');
        nextLi.children().eq(0).attr('tabindex', '-1');
    } else {
        nextLi.removeClass('disabled');
        nextLi.children().eq(0).removeAttr('tabindex');
    }
});
