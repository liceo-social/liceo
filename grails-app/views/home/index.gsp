<g:applyLayout name="general/empty">
    <content tag="title">Dashboard</content>
    <content tag="breadcrumb">
        <li class="breadcrumb-item">
            <g:link controller="home">home</g:link>
        </li>
    </content>
    <content tag="content">
        <div class="row">
            <div class="col-md-5">
                <g:render template="templates/assigned_people" />
            </div>
            <div class="col-md-6">

            </div>
        </div>
    </content>
</g:applyLayout>
