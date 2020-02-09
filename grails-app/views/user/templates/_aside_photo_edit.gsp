<g:uploadForm controller="user" action="updatePhoto" method="POST">
    <div class="card card-primary">
        <div class="card-body">
            <div class="text-center">
                <g:if test="${user.photo}">
                    <img
                        id="profile-image"
                        class="img-profile img-fluid img-bordered img-circle"
                        src="${storage.resolve(attachment: user.photo)}"
                        alt="foto de la persona">
                </g:if>
                <g:else>
                    <asset:image id="profile-image" src="default_user.jpg" alt="foto de la persona" class="img-profile img-fluid img-bordered img-circle" />
                </g:else>
            </div>
            <h3 class="profile-username-compact text-center">${user.name}</h3>
            <p class="text-muted text-center">${user.username}</p>
            <div class="text-center">
                <f:field bean="${user}" property="enabled" widget="active" wrapper="empty"/>
            </div>
            <div class="text-center mt-4">
                <f:field
                    bean="user"
                    property="photo"
                    widget="attachment"
                    widget-name="profile-photo"
                    widget-imgId="profile-image"
                    widget-labelName="profile-photo-label"
                    widget-placeholder="Pulsa para subir un fichero" />
                <g:hiddenField name="id" value="${user.id}" />
            </div>

        </div>
        <div class="card-footer">
            <g:submitButton
                name="submit"
                value="Actualizar Imagen"
                class="btn btn-primary btn-block" />
        </div>
    </div>
</g:uploadForm>
