<%@ page import="ma.*" %>
<%@ page import="ma.person.*" %>
<%@ page import="ma.security.*" %>
<div class="card">
    <div class="card-header">
        <h3 class="card-title">Filtrar Procesos</h3>
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-12">
                <g:applyLayout name="components/custom-field-wrapper">
                    <content tag="name">selectedPeople</content>
                    <content tag="label">Personas</content>
                    <content tag="widget">
                        <g:select
                          name="selectedPeople"
                          from="${filterOptions.people}"
                          value="${filter.selectedPeople}"
                          optionKey="id"
                          optionValue="fullName"
                          multiple="true" />
                    </content>
                </g:applyLayout>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <g:applyLayout name="components/custom-field-wrapper">
                    <content tag="name">selectedProjects</content>
                    <content tag="label">Proyectos</content>
                    <content tag="widget">
                        <g:select
                          name="selectedProjects"
                          from="${filterOptions.projects}"
                          value="${filter.selectedProjects}"
                          optionKey="id"
                          optionValue="name"
                          multiple="true" />
                    </content>
                </g:applyLayout>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <g:applyLayout name="components/custom-field-wrapper">
                    <content tag="name">selectedProcessTypes</content>
                    <content tag="label">Tipos de proceso</content>
                    <content tag="widget">
                        <g:select
                          name="selectedProcessTypes"
                          from="${filterOptions.processTypes}"
                          value="${filter.selectedProcessTypes}"
                          optionKey="id"
                          optionValue="name"
                          multiple="true" />
                    </content>
                </g:applyLayout>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
               <f:field
                   label="Solo Mis Procesos"
                   class="pt-4"
                   bean="filter"
                   property="onlyMines"
                   widget="switch"
                   wrapper="switch"
                   widget-value="${filter?.onlyMines}"/>
            </div>
        </div>
    </div>
    <div class="card-footer">
        <div class="row">
            <div class="col-6">
                <g:submitButton
                    class="btn btn-block btn-primary"
                    name="submitSearch"
                    value="Filtrar" />
            </div>
            <div class="col-6">
                <g:javascript>
                   const cleanFilters = () => {
                       $("#selectedPeople").val('').trigger('change');
                       $("#selectedProjects").val('').trigger('change');
                       $("#selectedProcessTypes").val('').trigger('change');
                   }
                </g:javascript>
                <input
                    onclick="cleanFilters()"
                    type="reset"
                    class="btn btn-block btn-default"
                    name="formReset"
                    value="Limpiar" />
            </div>
        </div>
    </div>
</div>
