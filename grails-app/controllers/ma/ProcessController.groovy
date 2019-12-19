package ma

class ProcessController {

    static scaffold = Process


    def create(ProcessCreation creation) {
        if (creation.hasErrors()) {
            render status: 404
            return
        }

        return [
            person: Person.get(creation.person),
            project: Project.get(creation.project),
            processTypeList: ProcessType.list(),
            process: new Process()
        ]
    }
}

class ProcessCreation implements grails.validation.Validateable {
    Long person
    Long project
}
