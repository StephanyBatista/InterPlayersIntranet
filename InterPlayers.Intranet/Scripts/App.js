'use strict';

var context, comunicacaoItems, linksItems;

ExecuteOrDelayUntilScriptLoaded(initializePage, "sp.js");

function initializePage()
{
    JSRequest.EnsureSetup();
    var hostweburl = decodeURIComponent(JSRequest.QueryString["SPHostUrl"]);
    context = new SP.ClientContext();
    var site = new SP.AppContextSite(context, hostweburl);
    var web = site.get_web();

    var query = SP.CamlQuery.createAllItemsQuery();

    var comunicacaoList = web.get_lists().getByTitle("Comunicação");
    comunicacaoItems = comunicacaoList.getItems(query);

    var linksList = web.get_lists().getByTitle("Links");
    linksItems = linksList.getItems(query);

    $(document).ready(function () {

        Chart.defaults.global.defaultFontColor = "#fff";

        loadLists();
    });

    function loadLists() {

        context.load(comunicacaoItems);
        context.load(linksItems);
        context.executeQueryAsync(onGetListsSuccess, onGetListsFail);
    }

    function onGetListsSuccess() {

        prepareComunicacaoList(comunicacaoItems);
        prepareLinksList(linksItems);

        $('#s4-titlerow').css('display', 'none');
    }

    // This function is executed if the above call fails
    function onGetListsFail(sender, args) {
        alert('Erro:' + args.get_message());
    }
}
