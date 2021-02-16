<%@ page import="ma.*" %>
<div id="show_note_modal_${nodeParam.id}" class="modal fade">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Alerta</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body text-left">
                    <p>${nodeParam.comment}</p>
                    <g:if test="${nodeParam.resolutionDate}">
                        <g:set var="resolutionDate" value="${g.formatDate(format: 'dd/MM/yyyy', date: nodeParam.resolutionDate)}" />
                        <g:set var="resolutionHeader" value="Resuelta" />
                        <div class="alert alert-primary mt-4">
                           Resuelta el <b>${resolutionDate}</b> por
                           <b><g:link controller="user" action="show" id="${nodeParam.updatedBy.id}">${nodeParam.updatedBy.name}</g:link></b>
                           con el siguiente comentario: <b>${nodeParam.resolution}</b>
                        </div>
                    </g:if>
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">
                        Volver
                    </button>
                </div>
        </div>
    </div>
</div>
