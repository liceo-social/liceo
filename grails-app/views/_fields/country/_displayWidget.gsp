<g:if test="${value}">
<span>${value.name}</span> / <asset:image
    alt="${value.name}"
    src="flags/${value.code.toLowerCase()}.png"
    title="${value.name}" />
</g:if>
