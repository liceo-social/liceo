<%@ page import="ma.*" %>
<%@ page import="ma.person.*" %>
<%@ page import="ma.security.*" %>
<div id="search_form" class="modal fade">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <g:form controller="person" method="GET" action="index">
                <div class="modal-header">
                    <h4 class="modal-title">Formulario de busqueda</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <g:render template="search/modal_personal"/>
                    <g:render template="search/modal_other_filters"/>
                    <g:render template="search/modal_fields"/>
                </div>
                <div class="modal-footer justify-content-between">
                    <g:submitButton
                        class="btn btn-primary"
                        name="submitSearch"
                        value="Buscar" />
                    <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">
                        Cancelar
                    </button>
                </div>
            </g:form>
        </div>
    </div>
</div>
