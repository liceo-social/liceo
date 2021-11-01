<div id="${g.pageProperty(name:'page.id')}" class="modal fade">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <!-- FORM -->
                <div class="modal-header">
                    <h4 class="modal-title">
                        <g:pageProperty name="page.modalTitle" />
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">                    
                    <g:pageProperty name="page.fields" />                    
                </div>
                <div class="modal-footer justify-content-between">
                    <g:pageProperty name="page.actions" />
                </div>
            <!-- FORM END -->
        </div>
    </div>
</div>
