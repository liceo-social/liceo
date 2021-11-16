<g:applyLayout name="general/empty">
    <content tag="title">403 No autorizado</content>
    <content tag="breadcrumb">
        <li class="breadcrumb-item">
            <g:link controller="home">Home</g:link>
        </li>
        <li class="breadcrumb-item">
            403
        </li>
    </content>
    <content tag="content">
        <div class="error-page">
            <h2 class="headline text-danger"> 403</h2>
            <div class="error-content">
                <h3><i class="fas fa-exclamation-triangle text-danger"></i> Oops! Recurso no autorizado.</h3>
                <p>
                    Has intentado acceder a una pagina a la que no tienes acceso.
                    Vuelve a la <g:link controller="home">pagina principal</g:link> por si acaso .
                </p>
            </div>
        </div>
    </content>
</g:applyLayout>
