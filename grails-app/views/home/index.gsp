<g:applyLayout name="general/empty">
    <content tag="title">Dashboard</content>
    <content tag="breadcrumb">
        <li class="breadcrumb-item">
            <g:link controller="home">home</g:link>
        </li>
    </content>
    <content tag="content">
        <div class="row">
            <div class="col-md-3">
                <g:render template="templates/statistics_panel"
                    model="[
                        title: 'Personas agregadas (total / activas)',
                        icon: 'fa-users',
                        number: "${statistics.addedPeopleCount} / ${statistics.addedActivePeopleCount}",
                        link: g.createLink(controller:"person", action:"index"),
                        linkLabel: 'Listado de personas'
                    ]"/>
            </div>
            <div class="col-md-3">
                <g:render template="templates/statistics_panel"
                   model="[
                       title: 'Personas asignadas a ' + statistics.currentUser.name,
                       icon: 'fa-users',
                       number: statistics.assignedPeopleCount,
                       link: g.createLink(controller:"person", action:"index", params: [handlers: statistics.currentUser.id]),
                       linkLabel: 'Listado de personas asignadas'
                   ]"/>
            </div>
            <div class="col-md-3">
                <g:render template="templates/statistics_panel"
                   model="[
                       title: 'Numero de proyectos',
                       icon: 'fa-project-diagram',
                       number: statistics.projectsCount,
                       link: g.createLink(controller:"project", action:"index"),
                       linkLabel: 'Listado de proyectos'
                   ]"/>
            </div>
            <div class="col-md-3">
                <g:render template="templates/statistics_panel"
                   model="[
                       title: 'Numero de procesos',
                       icon: 'fa-calendar-plus',
                       number: statistics.processesCount,
                       link: g.createLink(controller:"agenda", action:"index"),
                       linkLabel: 'Ver agenda'
                   ]"/>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3">
                <g:render template="templates/added_people" />
            </div>
            <div class="col-md-3">
                <g:render template="templates/assigned_people" />
            </div>
        </div>
    </content>
</g:applyLayout>
