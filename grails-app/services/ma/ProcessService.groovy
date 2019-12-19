package ma

import grails.gorm.services.Service

@Service(Process)
interface ProcessService {

    Process get(Serializable id)

    List<Process> list(Map args)

    Long count()

    void delete(Serializable id)

    Process save(Process process)

}