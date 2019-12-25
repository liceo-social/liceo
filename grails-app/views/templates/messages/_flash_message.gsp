<g:if test="${flash.message}">
    <div role="status" class="alert alert-success alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        ${flash.message}
    </div>
</g:if>