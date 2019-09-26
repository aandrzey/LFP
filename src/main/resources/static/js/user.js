$(document).ready(function () {

    let deleteButtonsTable = $(".deleteButtonTable");
    let ButtonModal = $(".ButtonModal");
    let modalBody = $(".modal-body");

    deleteButtonsTable.each(function () {
        $(this).on("click", function () {
            modalBody.text('Czy na pewno chcesz usunąć post?');
            ButtonModal.attr("href", '/post/delete/' + $(this).data('id'));
            ButtonModal.text("Usuń");
        })
    });

});

