<%@ page defaultCodec="html" %>
<div class="form-group control-group${invalid ? ' error' : ''}${required ? ' required' : ''}">
  <label for="${property}">${label}</label>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
    </div>
    <%= widget %>
  </div>
</div>