<g:set var="error">
    <g:hasErrors bean="${parent}" field="${property}">is-invalid</g:hasErrors>
</g:set>

<g:field
    class="form-control ${error}"
    required="${required ? 'required' : '' }"
    name="${property}"
    value="${attrs.value}"
    disabled="${attrs.disabled}"
    type="time" />
