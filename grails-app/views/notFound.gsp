<g:applyLayout name="general/empty">
    <content tag="title">404 No encontrado</content>
    <content tag="breadcrumb">
        <li class="breadcrumb-item">
            <g:link controller="home">Home</g:link>
        </li>
        <li class="breadcrumb-item">
            404
        </li>
    </content>
    <content tag="content">
        <div class="error-page">
            <h2 class="headline text-warning"> 404</h2>
            <div class="error-content">
                <h3><i class="fas fa-exclamation-triangle text-warning"></i> Oops! No lo encuentro.</h3>
                <p>
                    No puedo encontrar lo que buscas.
                    Vuelve a la <g:link controller="home">pagina principal</g:link> por si acaso .
                </p>
            </div>
        </div>
    </content>
</g:applyLayout>
