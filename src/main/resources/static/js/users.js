$(document).ready(function () {

    let deleteButtonsTable = $(".deleteButtonTable");
    let deleteButtonsModal = $(".deleteButtonModal");
    let modalBody = $(".modal-body");

    deleteButtonsTable.each(function () {
        $(this).on("click", function () {
            modalBody.text('Czy na pewno chcesz usunąć użytkownika: ' + $(this).data('username') + ' oraz wszystkie jego posty i wiadomości?');
            deleteButtonsModal.attr("href", '/admin/user/delete/' + $(this).data('id'));
        })
    })

});

