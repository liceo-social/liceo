package social.liceo.controller

import social.liceo.model.Person

interface FindPersonByIdDAO {
  Person findPersonById(Serializable id)
}
