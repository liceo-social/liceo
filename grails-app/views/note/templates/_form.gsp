<div class="row">
    <div class="col-4">
        <div class="form-group">
           <label for="severity">Importancia</label>
           <div class="controls">
                <g:select
                    class="form-control"
                    name="severity"
                    valueMessagePrefix="note.severity"
                    from="${['NOTE', 'WARNING', 'DANGER']}"
                    value="${note?.severity}" />
           </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-12">
        <f:field
            widget-placeholder="Comentario"
            label="Comentario"
            bean="note"
            property="comment"
            widget-value="${note?.comment}" />
        <!-- HIDDEN FIELDS -->
        <g:hiddenField name="person" value="${person?.id}" />
        <g:hiddenField name="id" value="${note?.id}" />
        <!-- HIDDEN FIELDS -->
    </div>
</div>
