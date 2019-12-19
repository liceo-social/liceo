<g:set var="error"><g:hasErrors bean="${bean}" field="${property}">is-invalid</g:hasErrors></g:set>

<g:textField
    placeholder="${attrs.placeholder}"
    class="form-control ${error}"
    name="${property}"
    value="${value}" />
