<g:if test="${value == 'NOTE'}">
    <span title="comentario" class="badge bg-success importance-badge">NOTA</span>
</g:if>
<g:if test="${value == 'WARNING'}">
    <span title="precaucion" class="badge badge-warning importance-badge">PRECAUCION</span>
</g:if>
<g:if test="${value == 'DANGER'}">
    <span title="accion inmediata" class="badge badge-danger importance-badge">ACCION IN</span>
</g:if>

