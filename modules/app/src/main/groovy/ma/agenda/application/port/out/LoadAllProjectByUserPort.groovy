package ma.agenda.application.port.out

import ma.agenda.domain.ProjectEntity

interface LoadAllProjectByUserPort {

  List<ProjectEntity> loadAllProjectByUser(Long userID)
}
