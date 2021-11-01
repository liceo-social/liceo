<g:if test="${value}">
<ul class="manyToMany-inline">
    <g:each in="${value}" var="i">
        <li>
            <span title="${i.name}">${i}</span>
        </li>
    </g:each>
</ul>
</g:if>
<g:else>
    <span>N/A</span>
</g:else>