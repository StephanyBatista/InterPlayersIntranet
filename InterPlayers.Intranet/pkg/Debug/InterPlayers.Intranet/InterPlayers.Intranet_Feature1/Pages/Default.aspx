<%-- The following 4 lines are ASP.NET directives needed when using SharePoint components --%>

<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>

<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%-- The markup and script in the following Content element will be placed in the <head> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    
    <SharePoint:ScriptLink name="sp.js" runat="server" OnDemand="true" LoadAfterUI="true" Localizable="false" />
    <meta name="WebPartPageExpansion" content="full" />

    <!-- Add your CSS styles to the following file -->
    <link href="../content/css/bootstrap.css" rel="stylesheet">
    <link href="../content/css/interplayers.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="../content/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>   
    <script type="text/javascript" src="../Scripts/App.js"></script>
    <script type="text/javascript" src="../Scripts/Comunicacao.js"></script>
    <script type="text/javascript" src="../Scripts/Links.js"></script>
    <script type="text/javascript">

        $('#s4-ribbonrow').remove();

        $(function () {

            $('#s4-titlerow').css('display', 'none');
            $('#suiteBarDelta').css('display', 'none');
            $('#s4-ribbonrow').css('display', 'none');
            $('#siteIcon').css('display', 'none');
        });
    </script>
</asp:Content>

<%-- The markup and script in the following Content element will be placed in the <body> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">

    <nav class="navbar navbar-expand-md navbar-light bg-light rounded">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="../content/img/logo-interplayers.png">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
  
        </div>        
    </nav>

    <div class="container">
        <div class="row">
            <div class="col-md-2">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card border-light mb-3" style="max-width: 20rem;">
                            <div class="card-header">Bibliotecas <span class="badge badge-light">5</span></div>
                            <div class="card-body">
                                <ul id="biblioteca-ul" class="nav flex-column">                                  
                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                                                                     
                </div>            
            </div>
            <div class="col-md-10">
                <div class="row">
                    <div class="col-md-8">
                        <div class="card border-light mb-3">
                            <div class="card-body">
                                <h4>Comunicação</h4>
                                <hr>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div id="accordion" class="accordion" role="tablist">
                                            
                                        </div>                              
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card border-light mb-3">
                            <div class="card border-light mb-3" style="max-width: 20rem;">
                                <div class="card-header">KPI Geral</div>
                                <div class="card-body">
                                    <canvas id="myChart" width="auto" height="120"></canvas>
                                </div>
                            </div>
                        </div> 
                        <div class="card border-light mb-3" style="max-width: 20rem;">
                            <div class="card-header ">Links Corporativos</div>
                            <div class="card-body">
                                <ul id="corporativo-ul" class="nav flex-column">
                                    
                                </ul>
                            </div>
                        </div>
                        <div class="card border-light mb-3" style="max-width: 20rem;">
                            <div class="card-header">Workflows</div>
                            <div class="card-body">
                                <ul class="nav flex-column">
                                    <li class="nav-item">
                                        <a class="nav-link active" href="#">
                                            <i class="fa fa-cogs" aria-hidden="true"></i>
                                            Aprovação de projetos
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active" href="#">
                                            <i class="fa fa-cogs" aria-hidden="true"></i>
                                            Folha de Rosto
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active" href="#">
                                            <i class="fa fa-cogs" aria-hidden="true"></i>
                                            Aquisição equipamento
                                        </a>
                                    </li>                                      
                                </ul>
                            </div>
                        </div>                 
                    </div>
                  
                </div>
            </div>
        </div>
    </div>

    <script>
        var ctx = document.getElementById("myChart");
        var myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
                datasets: [{
                    label: '# of Votes',
                    data: [12, 19, 3, 5, 2, 3],
                    backgroundColor: [
                        'rgba(63, 127, 191, 1)'
                    ],
                    borderColor: [
                        'rgba(63, 127, 191, 1)',
                        'rgba(63, 127, 191, 1)',
                        'rgba(63, 127, 191, 1)',
                        'rgba(63, 127, 191, 1)',
                        'rgba(63, 127, 191, 1)',
                        'rgba(63, 127, 191, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                legend: {
                    labels: {
                        fontColor: "black",
                        fontSize: 14
                    }
                },                    
                scales: {
                    yAxes: [{
                        ticks: {
                            fontColor: "black",
                            fontSize: 12,                             
                            beginAtZero:true
                        }
                    }],
                    xAxes: [{
                        ticks: {
                            fontColor: "black",
                            fontSize: 12
                        }
                    }]                        
                }
            }
        });
    </script>    

</asp:Content>
