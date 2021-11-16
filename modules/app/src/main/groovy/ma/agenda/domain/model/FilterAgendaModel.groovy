package ma.agenda.domain.model

import ma.agenda.domain.EventEntity
import ma.agenda.domain.PersonEntity
import ma.agenda.domain.ProcessTypeEntity
import ma.agenda.domain.ProjectEntity

class FilterAgendaModel {
    Set<EventEntity> events
    Set<PersonEntity> people
    Set<ProjectEntity> projects
    Set<ProcessTypeEntity> processTypes
}
