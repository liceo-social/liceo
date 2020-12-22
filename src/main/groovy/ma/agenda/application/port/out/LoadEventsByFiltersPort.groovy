package ma.agenda.application.port.out

import ma.agenda.domain.EventEntity

interface LoadEventsByFiltersPort {

  Set<EventEntity> filterByPeopleProjectAndType(
    Long userID,
    Date startDate,
    Boolean onlyUserProcesses,
    Set<Long> selectedPeople,
    Set<Long> selectedProjects,
    Set<Long> selectedProcessTypes
  )
}
