'use strict';

function prepareLinksList(linksItems) {

    var items = linksItems.getEnumerator();

    while (items.moveNext()) {

        var item = items.get_current();

        var id = item.get_item('ID');
        var title = item.get_item('Title');
        var url = item.get_item('URL');
        var tipo = item.get_item('Area');

        populateLinks({ id: id, title: title, url: url, tipo: tipo });
    }
}

function populateLinks(item) {

    if(item.tipo == 'Biblioteca')
        $('#biblioteca-ul')
            .append(
                '<li class="nav-item">'+
                    '<a class="nav-link" target="_blank" href="' + item.url.get_url() + '">' + item.title + '</a>'+
                '</li>'
        );
    else
        $('#corporativo-ul')
            .append(
                '<li class="nav-item">' +
                    '<a class="nav-link" target="_blank" href="' + item.url.get_url() + '">' + item.title + '</a>' +
                '</li>'
            );
}