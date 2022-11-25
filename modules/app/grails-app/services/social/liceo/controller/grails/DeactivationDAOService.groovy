package social.liceo.controller.grails

import ma.Person as PersonEntity
import ma.security.User as UserEntity
import social.liceo.controller.DeactivationDAO
import social.liceo.model.DeactivationRequestEntity
import social.liceo.model.Person

class DeactivationDAOService implements DeactivationDAO {
  @Override
  void saveRequest(Person person) {
    PersonEntity personEntity = PersonEntity.get(person.id)
    UserEntity requestedBy = UserEntity.get(person.deactivationRequestedBy.id)
    DeactivationRequestEntity requestEntity = new DeactivationRequestEntity(
      person: personEntity,
      requestedBy: requestedBy,
      motivation: person.deactivationMotivation,
      deactivationDate: person.deactivationApprovalDate
    )

    requestEntity.save()
  }

  @Override
  void saveApproval(Person person) {
    PersonEntity personEntity = PersonEntity.findById(person.id)
    UserEntity approvedBy = UserEntity.get(person.deactivationApprovedBy.id)
    DeactivationRequestEntity requestEntity = DeactivationRequestEntity.findByPerson(personEntity)

    personEntity.active = false
    personEntity.deletionMotivation = person.deactivationMotivation
    personEntity.deletedAt = new Date()
    personEntity.deletionRequestedBy = requestEntity.requestedBy
    personEntity.deletionApprovedBy = approvedBy

    DeactivationRequestEntity deactivationRequestEntity = DeactivationRequestEntity.findByPerson(personEntity)
    deactivationRequestEntity.delete()
  }
}
