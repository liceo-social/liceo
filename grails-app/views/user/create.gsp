<g:applyLayout name="general/empty">
    <content tag="title">Nuevo usuario</content>
    <content tag="breadcrumb">
        <li class="breadcrumb-item">
            <g:link controller="home">user</g:link>
        </li>
    </content>
    <content tag="content">
       <div class="row">
           <div class="col-sm-6">
                <div class="card">
                    <g:uploadForm name="upload" url="[action:'save']">
                        <div class="card-header">
                            <h3 class="card-title">Datos basicos</h3>
                        </div>
                        <div class="card-body">
                          <fieldset class="form">
                              <f:field
                                bean="user"
                                property="name"
                                widget-placeholder="Nombre del usuario" />
                              <f:field
                                bean="user"
                                property="username"
                                widget-placeholder="Correo usado para logarse" />
                              <f:field
                                widget="password"
                                bean="user"
                                property="password"
                                widget-placeholder="Password inicial" />
                              <label class="control-label" for="photo">Photo</label>
                              <f:field
                                      bean="user"
                                      property="photo"
                                      widget="attachment"
                                      widget-name="profile-photo"
                                      widget-imgId="profile-image"
                                      widget-labelName="profile-photo-label"
                                      widget-placeholder="Pulsa para subir un fichero" />
                          </fieldset>
                        </div>
                        <div class="card-footer">
                          <g:submitButton
                              name="create"
                              class="btn btn-primary save"
                              value="${message(code: 'default.button.create.label', default: 'Create')}" />
                        </div>
                    </g:uploadForm>
                </div>
            </div>
            <div class="col-sm-6 text-center">
                <g:img class="section" file="user_add.svg" />
            </div>
        </div>
    </content>
</g:applyLayout>
