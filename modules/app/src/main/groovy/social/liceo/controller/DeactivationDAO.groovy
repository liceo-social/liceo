package social.liceo.controller

import social.liceo.model.Person

interface DeactivationDAO {
  void saveRequest(Person person)
  void saveApproval(Person person)
}
