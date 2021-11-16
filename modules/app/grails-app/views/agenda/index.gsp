<content tag="title">Agenda</content>
<content tag="breadcrumb">
    <li class="breadcrumb-item">
        <g:link url="/">Home</g:link>
     </li>
    <li class="breadcrumb-item">Agenda</li>
</content>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title></title>
    </head>
    <body>
        <div class="row">
            <div class="col-md-3">
                <g:formRemote
                        name="myform"
                        update="updateMe"
                        method="GET"
                        url="[controller: 'agenda', action: 'search']">
                    <g:render template="templates/filters" />
                </g:formRemote>
            </div>
            <div class="col-md-9">
                <div id="updateMe">
                    <g:render template="templates/calendar" />
                </div>
            </div>
        </div>
    </body>
</html>
