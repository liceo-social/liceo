package ma.agenda.application.port.in

import groovy.transform.builder.Builder
import ma.agenda.domain.model.FilterAgendaModel

interface FilterAgendaUseCase {

  @Builder
  class Input {
    Integer userID
    Boolean onlyUserProcesses
    Date startDate
    Set<Long> selectedPeople
    Set<Long> selectedProjects
    Set<Long> selectedProcessTypes
  }

  FilterAgendaModel loadAgenda(Input input)
}
