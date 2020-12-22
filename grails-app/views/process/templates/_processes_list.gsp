<g:if test="${person.projects}">
    <div class="card card-info mb-0">
       <div class="card-header">
         <div class="row">
               <div class="col-8">
                   <g:form controller="process" action="index" id="${person.id}">
                        <g:select
                            from="${person.projects}"
                            optionKey="id"
                            optionValue="completeName"
                            noSelection="${['':'Filtrar listado por proyecto']}"
                            onchange="submit()"
                            value="${project?.id}"
                            name="projectId"/>
                    </g:form>
                </div>
                <div class="col-2">
                  <g:link
                     class="btn btn-primary btn-block edit"
                         controller="process"
                         action="create"
                         disable="${!person.active}"
                         params="[person: person.id, project: project?.id]">
                         <i class="fa fa-plus mr-1"></i>
                         Nuevo
                  </g:link>
                </div>
                <div class="col-2">
                    <g:link
                     class="btn btn-default btn-block"
                         controller="agenda"
                         action="index"
                         disable="${!person.active}"
                         params="[selectedPeople: [person.id], selectedProjects: [project?.id]]">
                         <i class="fa fa-calendar-alt mr-1"></i>
                         Ver agenda
                    </g:link>
                </div>
            </div>
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
                <g:render template="/templates/tables/no_results" />
            </g:else>
       </div>
       <div class="card-footer">
           <!-- PAGINATION -->
               <g:render
                   template="/templates/pagination/pagination"
                   model="[pagedResult: processes, controller: 'process']" />
            <!-- PAGINATION -->
       </div>
    </div>
</g:if>
<g:else>
    <div class="alert alert-warning alert-dismissible mb-0">
        <h5><i class="icon fas fa-info"></i> Atención!</h5>
        Para poder crear un proceso, edita esta persona y asignale un <b>proyecto</b> primero.
    </div>
</g:else>
