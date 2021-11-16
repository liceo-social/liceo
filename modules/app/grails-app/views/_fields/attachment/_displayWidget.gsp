<div class="widget-user-image widget-user-2">    
    <g:if test="${value}">
        <img 
            class="img-circle elevation-2" 
            src="${storage.resolve(attachment: value)}"
            alt="User Avatar">
    </g:if>
    <g:else>
        <asset:image
            class="img-circle elevation-2" 
            src="default_user.jpg"
            alt="default image" />
    </g:else>
</div>