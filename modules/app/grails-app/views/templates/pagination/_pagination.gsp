<g:set var="paginationMax" value="${grailsApplication.config.app.pagination.max}" />
<g:set var="totalCount" value="${pagedResult?.totalCount ?: 0}" />
<g:if test="${pagedResult && totalCount >= paginationMax}">
    <div class="pagination">
        <g:paginate
            max="${paginationMax}"
            controller="${controller}"
            action="index"
            total="${totalCount}"
            params="${params}"/>
    </div>
</g:if>
