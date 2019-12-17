<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'user')}" />
    <title>
        <g:message code="default.show.label" args="[entityName]" />
    </title>
</head>

<body>
    <div class="card card-widget widget-user-2">
        <div class="card-header">
            <h3 class="card-title">
                <i class="nav-icon fas fa-eye"></i>
                <g:message code="default.show.label" args="[entityName]" />
            </h3>
            <div class="card-tools">
                <ul class="nav nav-grails">
                    <li class="nav-item">
                        <g:link class="list" action="index">
                            <i class="nav-icon fas fa-list"></i>
                            <g:message code="default.list.label" args="[entityName]" />
                        </g:link>
                    </li>
                    <li class="nav-item">
                        <g:link class="create" action="create">
                            <i class="nav-icon fas fa-plus"></i>
                            <g:message code="default.new.label" args="[entityName]" />
                        </g:link>
                    </li>
                </ul>
            </div>
        </div>
        <!-- Add the bg color to the header using any of the bg-* classes -->        
        <div class="widget-user-header bg-${this.user.isAdmin() ? 'danger': 'primary'}">
            <div class="widget-user-image">
                <img class="img-circle elevation-2" src="/storage/${this.user.photo.filename}" alt="User Avatar">
            </div>
            <!-- /.widget-user-image -->
            <h3 class="widget-user-username"><f:display bean="user" property="username" /></h3>
            <h5 class="widget-user-desc">Lead Developer</h5>
        </div>
        <div class="card-body">
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:display bean="user" except="password,username,photo,filePath,bucket,filename"/>
            <g:form resource="${this.user}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="btn btn-primary edit" action="edit" resource="${this.user}">
                        <g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="btn btn-danger delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </div>
</body>

</html>