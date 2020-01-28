<g:set var="error">
<g:hasErrors bean="${parent}" field="${property}">is-invalid</g:hasErrors>
</g:set>

<g:textField
    placeholder="${attrs.placeholder}"
    class="form-control ${error}"
    required="${required ? 'required' : '' }"
    name="${property}"
    value="${g.formatDate(date:attrs.value, format: 'dd/MM/yyyy')}" />

<g:set var="dateFormat" value="DD/MM/YYYY"/>
<script>
    $(function() {
        $("input[name='${property}']").daterangepicker({
            locale: {
            "format": "${dateFormat}"
            },
            singleDatePicker: true,
            showDropdowns: true,
            <g:if test="${since}">
            minYear: ${raw(since)},
            </g:if>
            <g:if test="${to}">
            maxYear: ${raw(to)}
            </g:if>
        }, function (startDate, endDate, period) {
            $(this).val(startDate.format('L') + ' – ' + endDate.format('L'))
        });
    });
</script>
