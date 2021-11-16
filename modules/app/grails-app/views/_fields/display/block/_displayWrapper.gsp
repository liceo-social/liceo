<%@ page defaultCodec="html" %>
<div class="form-group control-group${invalid ? ' error' : ''}${required ? ' required' : ''}">
	<label for="${property}">${label}</label>
    <div class="controls">
		<%= widget %>
	</div>
</div>