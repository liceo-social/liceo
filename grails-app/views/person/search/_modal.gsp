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
                    <f:field
                        bean="${searchCommand}"
                        property="name"
                        label="Nombre"
                        class="form-control"
                        widget-placeholder="Termino que este contenido en el nombre" />
                    <f:field
                        label="Mostrar solo activos"
                        bean="${searchCommand}"
                        property="showOnlyActive" />
                    <g:render template="search/age_range" />
                    <f:field
                        label="Genero"
                        bean="${searchCommand}"
                        property="genres"
                        template="oneToMany"
                        widget="oneToOne"
                        widget-multiple="true"
                        widget-optionKey="id"
                        widget-optionValue="name"
                        widget-value="${searchCommand.genres}"
                        widget-from="${Genre.list()}" />
                    <f:field
                        label="Vias de acceso"
                        bean="${searchCommand}"
                        property="cameFrom"
                        template="oneToMany"
                        widget="oneToOne"
                        widget-value="${searchCommand.cameFrom}"
                        widget-multiple="true"
                        widget-optionKey="id"
                        widget-optionValue="name"
                        widget-from="${CameFrom.list()}" />
                    <f:field
                        label="Proyectos"
                        bean="${searchCommand}"
                        property="projects"
                        template="oneToMany"
                        widget="oneToOne"
                        widget-value="${searchCommand.projects}"
                        widget-multiple="true"
                        widget-optionKey="id"
                        widget-optionValue="name"
                        widget-from="${Project.list()}" />
                    <f:field
                        label="Origen"
                        bean="${searchCommand}"
                        property="countries"
                        template="oneToMany"
                        widget="oneToOne"
                        widget-value="${searchCommand.countries}"
                        widget-multiple="true"
                        widget-optionKey="id"
                        widget-optionValue="name"
                        widget-from="${Country.list()}" />
                    <f:field
                        label="Responsables"
                        bean="${searchCommand}"
                        property="handlers"
                        template="oneToMany"
                        widget="oneToOne"
                        widget-value="${searchCommand.handlers}"
                        widget-multiple="true"
                        widget-optionKey="id"
                        widget-optionValue="name"
                        widget-from="${User.list()}" />
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
