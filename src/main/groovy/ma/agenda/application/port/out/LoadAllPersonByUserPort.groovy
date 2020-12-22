package ma.agenda.application.port.out

import ma.agenda.domain.PersonEntity

interface LoadAllPersonByUserPort {

  List<PersonEntity> loadAllPersonByUser(Long userID)
}
