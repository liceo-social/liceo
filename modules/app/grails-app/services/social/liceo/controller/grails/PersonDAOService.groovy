package social.liceo.controller.grails

import ma.Person as PersonEntity
import social.liceo.controller.FindPersonByIdDAO
import social.liceo.model.Person

class PersonDAOService implements FindPersonByIdDAO {
  @Override
  Person findPersonById(Serializable id) {
    PersonEntity personEntity = PersonEntity.get(id)

    return new Person(id: personEntity.id)
  }
}
