package ma.agenda.application.port.out

import ma.agenda.domain.ProcessTypeEntity

interface LoadAllProcessTypePort {

  List<ProcessTypeEntity> loadAllProcessTypes()
}
