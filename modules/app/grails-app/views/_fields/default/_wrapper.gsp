<%@ page defaultCodec="html" %>
<g:if test="${disabled}">
    <div class="form-group control-group">
        <label for="${property}">${label}</label>
        <div class="controls">
            <%= widget %>
        </div>
    </div>
</g:if>
<g:else>
    <div class="form-group control-group${invalid ? ' error' : ''}${required ? ' required' : ''}">
        <label for="${property}">${label}</label>
        <div class="controls">
            <%= widget %>
        </div>
    </div>
</g:else>
