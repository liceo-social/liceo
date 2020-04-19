<div class="form-group control-group">
<label for="age">Edad</label>
<div class="row controls">
    <div class="col-3">
        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text">Desde</span>
            </div>
            <g:field
                bean="${searchCommand}"
                class="form-control"
                type="number"
                name="minAge"
                min="0"
                max="100"
                value="${searchCommand.minAge}" />
        </div>
    </div>
    <div class="col-3">
        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text">Hasta</span>
            </div>
            <g:field
                bean="${searchCommand}"
                class="form-control"
                type="number"
                name="maxAge"
                min="0"
                max="140"
                value="${searchCommand.minAge}" />
        </div>
    </div>
</div>

</div>
