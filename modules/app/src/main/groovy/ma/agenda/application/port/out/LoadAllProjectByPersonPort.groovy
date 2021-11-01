package ma.agenda.application.port.out

import ma.agenda.domain.ProjectEntity

interface LoadAllProjectByPersonPort {

  List<ProjectEntity> loadAllProjectByPerson(Long personID)
}
