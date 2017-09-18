'use strict';

var itemsStoreds = [];

function prepareComunicacaoList(comunicacaoItems) {

    var items = comunicacaoItems.getEnumerator();

    while (items.moveNext()) {

        var item = items.get_current();

        var id = item.get_item('ID');
        var title = item.get_item('Title');
        var body = item.get_item('Body');
        var listRef = item.get_item('FileDirRef');
        var url = listRef + '/DispForm.aspx?ID=' + id;

        itemsStoreds.push({ id: id, title: title, body: body, listRef: listRef, url: url });
    }

    populateComunicacao(true);
}

function populateComunicacao(onlyThree) {

    var itemMaxNumber = 3;
    var expanded = "true";
    for (let index = itemsStoreds.length - 1; index >= 0; index--) {

        if (itemMaxNumber === 0 && onlyThree) {

            $('#verMais').removeClass('hidden');
            break;
        }
        else
            $('#verMais').addClass('hidden');

        var show = expanded == 'true' ? 'show' : '';
        $('#accordion')
            .append(
                '<div class="card">'+
                    '<div class="card-header" role="tab" id="heading' + index + '">'+
                    '<h6 class="mb-0">'+
                        '<a data-toggle="collapse" href="#collapse' + index + '" aria-expanded="' + expanded + '" aria-controls="collapse' + index + '">'+
                            itemsStoreds[index].title +
                        '</a>'+
                    '</h6>'+
                    '</div>'+
                        '<div id="collapse' + index + '" class="collapse '+ show +'" role="tabpanel" aria-labelledby="heading' + index + '" data-parent="#accordion">'+
                        '<div class="card-body">'+
                                itemsStoreds[index].body +
                        '</div>' +
                    '</div>' +
                '</div>'
            );

        itemsStoreds.splice(index, 1);
        itemMaxNumber--;
        expanded = "false";
    }
}