<%@ page import="ma.*" %>
<div id="resolve_modal" class="modal fade">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <g:form controller="note" action="resolve">
                <div class="modal-header">
                    <h4 class="modal-title">Resolver alerta</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p><g:message code="note.resolution.disclaimer"/></p>
                    <textarea class="motivation" name="resolution"></textarea>
                    <g:hiddenField name="id" value="${bean.id}" />
                </div>
                <div class="modal-footer justify-content-between">
                    <g:submitButton
                        class="btn btn-warning"
                        name="submitSearch"
                        value="Resolver" />
                    <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">
                        Cancelar
                    </button>
                </div>
            </g:form>
        </div>
    </div>
</div>
