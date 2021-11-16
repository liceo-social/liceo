<%@ page import="ma.*" %>
<%@ page import="ma.person.*" %>
<%@ page import="ma.security.*" %>
<div id="disable_modal" class="modal fade">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <g:form controller="person" action="deactivate">
                <div class="modal-header">
                    <h4 class="modal-title">Dar de baja</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p><g:message code="person.disable.disclaimer"/></p>
                    <textarea class="motivation" name="motivation"></textarea>
                    <g:hiddenField name="person.id" value="${person.id}" />
                </div>
                <div class="modal-footer justify-content-between">
                    <g:submitButton
                        class="btn btn-danger"
                        name="submitSearch"
                        value="Dar de baja" />
                    <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">
                        Cancelar
                    </button>
                </div>
            </g:form>
        </div>
    </div>
</div>
