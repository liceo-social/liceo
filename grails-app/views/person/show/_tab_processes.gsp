<div class="tab-pane fade show active card-info" role="tabpanel" id="custom-tabs-one-projects" role="tabpanel" aria-labelledby="custom-tabs-one-projects-tab">
    <div class="card-body">
        <div class="card card-primary">
           <div class="card-header">
               <h3 class="card-title">Filtra por proyecto:</h3>
           </div>
           <div class="card-body">
               <g:form controller="person" action="processes" id="${person.id}">
                    <g:select
                        from="${person.projects}"
                        optionKey="id"
                        optionValue="name"
                        noSelection="${['':'Sin filtrar']}"
                        onchange="submit()"
                        value="${project?.id}"
                        name="projectId"/>
                </g:form>
           </div>
           <g:if test="${project}">
               <div class="card-footer">
                     <g:link
                         class="btn btn-primary edit"
                         controller="process"
                         action="create"
                         params="[person: person.id, project: project.id]">Crear nuevo proceso</g:link>
               </div>
           </g:if>
        </div>
        <div class="card card-primary">
           <div class="card-header">
               <h3 class="card-title">Procesos:</h3>
           </div>
           <div class="card-body p-0">
                <g:if test="${processes}">
                    <f:table 
                        collection="${processes}" 
                        displayStyle="table_wnr"
                        template="table_processes"
                        properties="description, meetingDate, project, type" />
                </g:if>
                <g:else>
                    No hay resultados
                </g:else>
           </div>
        </div>

    </div>
</div>