<g:uploadForm controller="person" action="updatePhoto" method="POST">
    <div class="text-center">
        <g:if test="${person.photo}">
            <img 
                id="profile-image"
                class="img-profile img-fluid img-bordered img-circle" 
                src="${storage.resolve(attachment: person.photo)}" 
                alt="foto de la persona">
        </g:if>
        <g:else>
            <asset:image id="profile-image" src="default_user.jpg" alt="foto de la persona" class="img-profile img-fluid img-bordered img-circle" />
        </g:else>
    </div>    
    <h3 class="profile-username text-center">${person.fullname}</h3>
    <f:field 
        bean="person" 
        property="photo" 
        widget="attachment" 
        widget-name="profile-photo"
        widget-imgId="profile-image"
        widget-labelName="profile-photo-label"
        widget-placeholder="Pulsa para subir un fichero" />
    <g:hiddenField name="id" value="${person.id}" />
    <div class="d-flex justify-content-between mt-4 mb-2">
        <g:submitButton 
            name="update"
            value="Actualizar"
            class="btn btn-primary btn-flat mr-1" style="flex-grow:1;" />
        <g:link 
            controller="person"
            action="show"
            id="${person.id}"
            class="btn btn-default btn-flat ml-1" style="flex-grow:1;">Cancelar</g:link>
    </div>    
</g:uploadForm>