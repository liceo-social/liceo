<g:set var="error"><g:hasErrors bean="${bean}" field="${property}">is-invalid</g:hasErrors></g:set>

<g:if test="${attrs.rich}">
    <g:textArea class="summernote" name="myField" value="myValue" rows="5" cols="40"/>
</g:if>
<g:else>
    <g:textField
        placeholder="${attrs.placeholder}"
        class="form-control ${error}"
        name="${property}"
        value="${value}" />
</g:else>