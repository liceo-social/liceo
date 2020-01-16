<div class="tab-pane fade show active card-info"
    role="tabpanel"
    id="custom-tabs-one-projects"
    role="tabpanel"
    aria-labelledby="custom-tabs-one-projects-tab">
    <div class="card-body p-0">
        <g:if test="${attachments}">
            <f:table
                collection="${attachments}"
                template="table_process_attachments"
                displayStyle="table_wnr"
                properties="description, attachment.filename" />
        </g:if>
        <g:else>
            <g:render template="/templates/tables/no_results" />
        </g:else>
    </div>
</div>
