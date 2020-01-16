<g:if test="${flash.message}">
    <div role="status" class="alert alert-success alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <h5><i class="icon fas fa-check"></i> Bien!</h5>
        ${flash.message}
    </div>
</g:if>
