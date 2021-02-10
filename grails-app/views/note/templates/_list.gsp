<div class="card card-info mb-0"
    id="custom-tabs-one-projects"
    aria-labelledby="custom-tabs-one-projects-tab">
   <div class="card-header">
       <div class="row">
            <div class="col-10">
               <g:form controller="note" action="index" id="${person?.id}">
                   <g:select
                       class="form-control"
                       name="severity"
                       valueMessagePrefix="note.severity"
                       from="${['NOTE', 'WARNING', 'DANGER']}"
                       onchange="submit()"
                       noSelection="${['':'Todos']}"
                       value="${params?.severity}" />
               </g:form>
           </div>
           <div class="col-2">
                <g:link
                    class="btn btn-block btn-primary edit"
                    controller="note"
                    action="create"
                    disabled="${!person?.active}"
                    params="[person: person?.id]">
                    <i class="fa fa-plus mr-1"></i>Nueva Alerta
                </g:link>
           </div>
       </div>
   </div>
   <div class="card-body p-0">
        <g:if test="${notes}">
            <f:table
                collection="${notes}"
                displayStyle="table_wnr"
                template="table_notes"
                properties="comment, severity, dateCreated, lastUpdated" />
        </g:if>
        <g:else>
            <g:render template="/templates/tables/no_results" />
        </g:else>
   </div>
   <div class="card-footer">
       <!-- PAGINATION -->
           <g:render
               template="/templates/pagination/pagination"
               model="[pagedResult: notes, controller: 'note']" />
        <!-- PAGINATION -->
   </div>
</div>
