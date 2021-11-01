<div class="card card-info mb-0"
    id="custom-tabs-one-projects"
    aria-labelledby="custom-tabs-one-projects-tab">
   <div class="card-header">
       <div class="row">
           <div class="col-10">
               <g:form controller="authorization" action="index" id="${person?.id}">
                    <g:select
                        from="${availableProjects}"
                        optionKey="id"
                        optionValue="completeName"
                        noSelection="${['':'Todos']}"
                        onchange="submit()"
                        value="${project?.id}"
                        name="projectId"/>
               </g:form>
           </div>
           <div class="col-2">
                <g:link
                    class="btn btn-block btn-primary edit"
                    controller="authorization"
                    action="create"
                    disabled="${!person?.active}"
                    params="[person: person?.id]">
                    <i class="fa fa-plus mr-1"></i>Nuevo
                </g:link>
           </div>
       </div>
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
   <div class="card-footer">
       <!-- PAGINATION -->
           <g:render
               template="/templates/pagination/pagination"
               model="[pagedResult: authorizations, controller: 'authorization']" />
        <!-- PAGINATION -->
   </div>
</div>
