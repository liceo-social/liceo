<g:textField
    placeholder="${attrs.placeholder}"
    class="form-control"
    name="${property}"
    value="${value}" />

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
  });
});
</script>