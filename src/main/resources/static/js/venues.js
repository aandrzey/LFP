$(document).ready(function () {

    let deleteButtonsTable = $(".deleteButtonTable");
    let verifyButtonsTable =$(".verifyButtonTable");
    let ButtonModal = $(".ButtonModal");
    let modalBody = $(".modal-body");

    deleteButtonsTable.each(function () {
        $(this).on("click", function () {
            modalBody.text('Czy na pewno chcesz usunąć miejsce: ' + $(this).data('name') + ' oraz wszystkie posty gdzie występuje?');
            ButtonModal.attr("href", '/admin/venue/delete/' + $(this).data('id'));
            ButtonModal.text("Usuń");
        })
    });

    verifyButtonsTable.each(function () {
        $(this).on("click", function () {
            modalBody.text('Czy na pewno chcesz zweryfikować miejsce: ' + $(this).data('name') + '. Po weryfikacji będzie ono dostępne do wyboru przy tworzeniu postów.');
            ButtonModal.attr("href", '/admin/venue/verify/' + $(this).data('id'));
            ButtonModal.text("Zweryfikuj");

        })
    });

});

