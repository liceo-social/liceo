<div class="card card-primary">
    <div class="card-body">
        <div class="text-center">
            <g:if test="${user.photo}">
                <g:set var="photoUrl">
                    <storage:resolve attachment="${user.photo}" />
                </g:set>
                <img class="img-circle dashboard elevation-2" src="${photoUrl}" alt="User Avatar">
            </g:if>
            <g:else>
                    <asset:image
                    class="img-circle elevation-2 dashboard"
                    src="default_user.jpg"
                    alt="Default user image" />
            </g:else>
        </div>
        <h3 class="profile-username-compact text-center">${user.name}</h3>
        <p class="text-muted text-center">${user.username}</p>
        <div class="text-center">
            <f:field bean="${user}" property="enabled" widget="active" wrapper="empty"/>
        </div>
    </div>
    <div class="card-footer">
        <g:link
            id="${user.id}"
            name="editPhoto"
            action="editPhoto"
            class="btn btn-primary btn-block">Cambiar Imagen</g:link>
        <g:link
            id="${user.id}"
            name="changePassword"
            controller="user"
            action="changePasswordEdit"
            class="btn btn-danger btn-block">Cambiar password</g:link>
    </div>
</div>
