<g:if test="${flash.message}">
    <script>
        $(document).ready(function() {
            $(document).Toasts('create', {
                title: 'Mensaje',
                body: "${flash.message}",
                class: 'bg-success',
                autohide: true,
                delay: 2000
            });
        });
    </script>
</g:if>
