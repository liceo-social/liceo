<div class="row display-inline">
    <div class="col-6 label">
        ${label}
    </div>
    <div class="col-6">
        <g:if test="${(value instanceof Boolean) || value}">
            <%= widget %>
        </g:if>
        <g:else>
        ---
        </g:else>
    </div>
</div>

