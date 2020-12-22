<g:select
   class="form-control"
   disabled="${attrs.disabled}"
   name="${property}"
   noSelection="${['null': attrs.placeholder ?: 'Selecciona...']}"
   onchange="${attrs.onchange}"
   from="${attrs.from}"
   multiple="${attrs.multiple ?: false}"
   optionKey="${attrs.optionKey}"
   optionValue="${attrs.optionValue}"
   value="${attrs.value}"/>

