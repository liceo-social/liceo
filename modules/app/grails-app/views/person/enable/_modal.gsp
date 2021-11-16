<%@ page import="ma.*" %>
<%@ page import="ma.person.*" %>
<%@ page import="ma.security.*" %>
<div id="enable_modal" class="modal fade">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <g:form controller="person" action="activate">
                <div class="modal-header">
                    <h4 class="modal-title">Habilitar de nuevo este registro</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p><g:message code="modal.generic.areyousure"/></p>
                    <g:hiddenField name="person.id" value="${person.id}" />
                </div>
                <div class="modal-footer justify-content-between">
                    <g:submitButton
                        class="btn btn-danger"
                        name="submitSearch"
                        value="Habilitar" />
                    <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">
                        Cancelar
                    </button>
                </div>
            </g:form>
        </div>
    </div>
</div>
