package social.liceo.model

import ma.Person as PersonEntity
import ma.security.User as UserEntity

class DeactivationRequestEntity {
  PersonEntity person
  UserEntity requestedBy
  String motivation

  static mappings = {
    table 'deactivation_request'
  }
}
