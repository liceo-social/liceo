<g:if test="${flash.type}">
    <g:set var="background" value="bg-${flash.type}" />
</g:if>
<g:else>
    <g:set var="background" value="bg-success" />
</g:else>

<g:if test="${flash.message}">
    <script>
        $(document).ready(function() {
            $(document).Toasts('create', {
                title: "${g.message(code: flash.title, default: flash.title) ?: 'Mensaje'}",
                body: "${g.message(code: flash.message, default: flash.message, args: flash.args)}",
                class: "${background}",
                autohide: true,
                delay: 2000
            });
        });
    </script>
</g:if>
