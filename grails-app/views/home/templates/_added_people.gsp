<!-- USERS LIST -->
<div class="card">
    <div class="card-body p-0">
        <g:if test="${statistics.addedPeople}">
            <ul class="products-list product-list-in-card pl-2 pr-2">
                <g:each var="person" in="${statistics.addedPeople}">
                  <li class="item">
                    <div class="product-img">
                        <g:if test="${person.photo}">
                            <img
                                class="img-size-50"
                                src="${storage.resolve(attachment: person.photo)}"
                                alt="User Avatar">
                        </g:if>
                        <g:else>
                            <asset:image src="default_user.jpg" alt="foto de la persona" class="img-circle dashboard elevation-2" />
                        </g:else>
                    </div>
                    <div class="product-info">
                       <g:link
                            class="product-title"
                            controller="person"
                            action="show"
                            id="${person.id}">${person.fullname}
                            <g:if test="${!person.active}">
                                <span class="badge badge-danger float-right">
                                    Inactivo
                                </span>
                            </g:if>
                        </g:link>
                        <g:set var="noteStats" value="${person.noteStatistics}" />
                        <g:set var="noteCount" value="${noteStats.notes}" />
                        <g:set var="warningCount" value="${noteStats.warnings}" />
                        <g:set var="dangerCount" value="${noteStats.dangers}" />

                        <g:if test="${noteCount}">
                            <g:link
                                controller="note"
                                action="index"
                                id="${person.id}"
                                params="[severity: 'NOTE']">
                                <span title="${noteCount} alerta/s a revisar" class="badge badge-primary float-right ml-1">${noteCount}</span>
                            </g:link>
                        </g:if>
                        <g:if test="${warningCount}">
                            <g:link
                                controller="note"
                                action="index"
                                id="${person.id}"
                                params="[severity: 'WARNING']">
                                <span title="${warningCount} alerta/s a tener en cuenta" class="badge badge-warning float-right ml-1">${warningCount}</span>
                            </g:link>
                        </g:if>
                        <g:if test="${dangerCount}">
                            <g:link
                                controller="note"
                                action="index"
                                id="${person.id}"
                                params="[severity: 'DANGER']">
                                <span title="${dangerCount} alerta/s requieren accion inmediata" class="badge badge-danger float-right ml-1">${dangerCount}</span>
                            </g:link>
                        </g:if>
                        <span class="product-description">
                            ${time.ago(time: person.lastUpdated)}
                        </span>
                    </div>
                  </li>
                </g:each>
            </ul>
        </g:if>
        <g:else>
            <g:render template="/templates/tables/no_results" />
        </g:else>
    <!-- /.users-list -->
    </div>
    <!-- /.card-body -->
    <div class="card-footer text-center">
        <g:link controller="person" action="index">Ver todas</g:link>
    </div>
    <!-- /.card-footer -->
</div>
