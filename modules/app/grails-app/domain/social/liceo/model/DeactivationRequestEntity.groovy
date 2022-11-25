package social.liceo.model

import ma.Person as PersonEntity
import ma.security.User as UserEntity

class DeactivationRequestEntity {
  PersonEntity person
  UserEntity requestedBy
  String motivation
  Date deactivationDate

  static constraints = {
    deactivationDate nullable: true
  }

  static mapping = {
    table 'deactivation_request_entity'
  }
}
