<div class="user-block">
<g:if test="${value}">
    <img 
        alt="Avatar" 
        class="img-circle elevation-2" 
        src="${storage.resolve(attachment: value)}">
        </g:if>
        <g:else>
            <asset:image
                class="img-circle elevation-2"
                src="default-image.jpg"
                alt="default image" />
    </g:else>
</div>