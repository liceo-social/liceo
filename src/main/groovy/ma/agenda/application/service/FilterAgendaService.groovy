package ma.agenda.application.service

import ma.agenda.application.port.in.FilterAgendaUseCase
import ma.agenda.application.port.out.LoadAllPersonByUserPort
import ma.agenda.application.port.out.LoadAllProcessTypePort
import ma.agenda.application.port.out.LoadAllProjectByUserPort
import ma.agenda.application.port.out.LoadEventsByFiltersPort
import ma.agenda.application.port.out.ResolveLinkPort
import ma.agenda.domain.EventEntity
import ma.agenda.domain.model.FilterAgendaModel
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@Service
class FilterAgendaService implements FilterAgendaUseCase {

  @Autowired
  LoadAllPersonByUserPort loadAllPersonByUser

  @Autowired
  LoadAllProjectByUserPort loadAllProjectByUser

  @Autowired
  LoadAllProcessTypePort loadAllProcessType

  @Autowired
  LoadEventsByFiltersPort loadEventsByFiltersPort

  @Autowired
  ResolveLinkPort resolveLinkPort

  @Override
  FilterAgendaModel loadAgenda(Input input) {
    Set<EventEntity> events = loadEventsByFiltersPort.filterByPeopleProjectAndType(
      input.userID,
      input.startDate,
      input.onlyUserProcesses,
      input.selectedPeople,
      input.selectedProjects,
      input.selectedProcessTypes
    )

    Set<EventEntity> eventsWithURL = events.collect {
      addURL(it)
    }

    return new FilterAgendaModel(
      people: loadAllPersonByUser.loadAllPersonByUser(input.userID),
      projects: loadAllProjectByUser.loadAllProjectByUser(input.userID),
      processTypes: loadAllProcessType.loadAllProcessTypes(),
      events: eventsWithURL
    )
  }

  private EventEntity addURL(EventEntity entity) {
    entity.url = resolveLinkPort.resolveLink([controller: 'process', action: 'show', id: entity.id])
    return entity
  }
}
