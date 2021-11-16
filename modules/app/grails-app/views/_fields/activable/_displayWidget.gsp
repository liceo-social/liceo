<g:set var="id" value="${attrs.id}" />
<div class="clearfix">
    <g:if test="${value}">
        <div class="icheck-default d-inline">
            <input type="radio" name="${id}" checked="" disabled="" id="${id}">
            <label for="${id}"></label>
        </div>
    </g:if>
    <g:else>
        <div class="icheck-default d-inline">
            <input type="radio" name="${id}" disabled="" id="${id}">
            <label for="${id}"></label>
        </div>
    </g:else>
</div>
