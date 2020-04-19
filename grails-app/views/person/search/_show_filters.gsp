<ul class="filters">
    <g:if test="${searchCommand.name}">
        <li><span class="tag-title">nombre:</span> ${searchCommand.name}</li>
    </g:if>
    <g:if test="${searchCommand.showOnlyActive}">
        <li><span class="tag-title">solo activos</span></li>
    </g:if>
    <g:if test="${searchCommand.maxAge}">
        <li><span class="tag-title">edad max:</span> ${searchCommand.maxAge}</li>
    </g:if>
    <g:if test="${searchCommand.minAge}">
            <li><span class="tag-title">edad min:</span> ${searchCommand.minAge}</li>
        </g:if>
    <g:if test="${searchCommand.genres}">
        <li><span class="tag-title">genero:</span> ${g.join(in: searchCommand.genres.name, delimiter: ',')}</li>
    </g:if>
    <g:if test="${searchCommand.cameFrom}">
        <li><span class="tag-title">vias de acceso:</span> ${searchCommand.cameFrom.name.join(',')}</li>
    </g:if>
    <g:if test="${searchCommand.projects}">
        <li><span class="tag-title">proyectos:</span> ${searchCommand.projects.name.join(',')}</li>
    </g:if>
    <g:if test="${searchCommand.countries}">
        <li><span class="tag-title">origen:</span> ${searchCommand.countries.name.join(',')}</li>
    </g:if>
    <g:if test="${searchCommand.handlers}">
        <li><span class="tag-title">responsable:</span> ${searchCommand.handlers.name.join(',')}</i></li>
    </g:if>
</ul>
