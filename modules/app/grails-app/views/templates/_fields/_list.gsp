<dl class="dl-horizontal property-list ${domainClass.decapitalizedName}">
    <g:each in="${domainProperties}" var="p">
        <dt><g:message code="${domainClass.decapitalizedName}.${p.name}.label" default="${p.defaultLabel}" /></dt>
        <dd class="property-value" aria-labelledby="${p.name}-label">${body(p)}</dd>
    </g:each>
</ol>