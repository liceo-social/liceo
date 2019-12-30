<div class="user-table-photo-block">
    <g:if test="${value}">
        <img 
            alt="Avatar" 
            class="img-circle elevation-2" 
            src="${storage.resolve(attachment: value)}">
    </g:if>
    <g:else>
        <asset:image
            class="img-circle elevation-2"
            src="default_user.jpg"
            alt="default image" />
    </g:else>
</div>