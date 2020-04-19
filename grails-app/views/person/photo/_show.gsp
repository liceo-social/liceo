 <div class="text-center">
    <g:if test="${person.photo}">
        <img 
            class="img-profile img-fluid img-bordered img-circle" 
            src="${storage.resolve(attachment: person.photo)}" 
            alt="foto de la persona">
    </g:if>
    <g:else>
        <asset:image src="default_user.jpg" alt="foto de la persona" class="img-profile img-fluid img-bordered img-circle" />
    </g:else>
</div>
<h3 class="profile-username text-center">
    ${person.fullname}
    <div class="col-12 h5 mt-3">
        <f:display 
            bean="person" 
            property="active"  
            widget="active" />
    </div>
</h3>
<g:if test="${person.active}">
    <g:link
      controller="person"
      action="editPhoto"
      id="${person.id}"
      class="btn btn-default btn-block photo-button"><b>Cambiar foto</b></g:link>
</g:if>
