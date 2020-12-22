package ma.agenda.domain

import groovy.transform.Canonical

import java.time.LocalDateTime

@Canonical
class EventEntity {
  Long id
  String title
  String description
  String url
  Boolean allDay
  LocalDateTime startStr
  LocalDateTime endStr
}
