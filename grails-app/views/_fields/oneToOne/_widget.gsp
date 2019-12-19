<g:select
   class="form-control"
   name="${property}"
   noSelection="${['null':'Selecciona...']}"
   from="${attrs.from}"
   multiple="${attrs.multiple ?: false}"
   optionKey="${attrs.optionKey}"
   optionValue="${attrs.optionValue}"
   value="${attrs.value}"/>
