<g:set var="error">
<g:hasErrors bean="${parent}" field="${property}">is-invalid</g:hasErrors>
</g:set>

<g:textField
    placeholder="${attrs.placeholder}"
    class="form-control ${error}"
    required="${required ? 'required' : '' }"
    name="${property}"
    value="${g.formatDate(date:attrs.value, format: 'dd/MM/yyyy')}" />

<script>


$(function() {
  $("input[name='${property}']").daterangepicker({
    locale: {
    "format": "DD/MM/YYYY"
    },
    singleDatePicker: true,
    showDropdowns: true,
    minYear: parseInt(moment().format('YYYY')),
    maxYear: parseInt(moment().format('YYYY'),10)
  }, function (startDate, endDate, period) {
      $(this).val(startDate.format('L') + ' – ' + endDate.format('L'))
  });
});
</script>