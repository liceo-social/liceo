<div class="tab-pane fade show active card-info" role="tabpanel" id="custom-tabs-one-projects" role="tabpanel" aria-labelledby="custom-tabs-one-projects-tab">
    <div class="card-body">
        <div class="card card-primary">
           <div class="card-header">
               <h3 class="card-title">Filtra por proyecto:</h3>
           </div>
           <div class="card-body">
               <g:form controller="authorization" action="index" id="${person.id}">
                    <g:select
                        from="${person.projects}"
                        optionKey="id"
                        optionValue="completeName"
                        noSelection="${['':'Sin proyecto']}"
                        onchange="submit()"
                        value="${project?.id}"
                        name="projectId"/>
                </g:form>
           </div>
            <div class="card-footer">
                <g:link
                    class="btn btn-primary edit"
                    controller="authorization"
                    action="create"
                    params="[person: person.id, project: project?.id]">Crear nueva autorizacion</g:link>
            </div>
        </div>
        <div class="card card-primary">
           <div class="card-header">
               <h3 class="card-title">Autorizaciones:</h3>
           </div>
           <div class="card-body p-0">
                <g:if test="${authorizations}">
                    <f:table
                        collection="${authorizations}"
                        displayStyle="table_wnr"
                        template="table_authorizations"
                        properties="description, project, dateCreated, lastUpdated" />
                </g:if>
                <g:else>
                    <g:render template="/templates/tables/no_results" />
                </g:else>
           </div>
        </div>

    </div>
</div>
