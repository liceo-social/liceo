<div class="card card-${pageProperty(name: 'page.cardType') ?: 'default'}">
    <div class="card-header">
        <h3 class="card-title">
            <g:pageProperty name="page.cardTitle" />
        </h3>
    </div>
    <div class="card-body">
        <g:pageProperty name="page.cardBody" />
    </div>
    <g:if test="${pageProperty(name: 'page.cardFooter')}">
        <div class="card-footer">
            <g:pageProperty name="page.cardFooter" />
        </div>
    </g:if>
</div>
