package ma

class ProcessController {

    static scaffold = Process


    def create(ProcessCreation creation) {
        if (creation.hasErrors()) {
            render status: 404
            return
        }

        return [
            process: new Process(
                person: Person.get(creation.person),
                project: Project.get(creation.project)
            )
        ]
    }

    def save(Process process) {
        if (process.hasErrors()) {
            respond(process.errors, view: 'create', model: [process: process])
            return
        }

        process.save()

        redirect(
            controller: 'process', 
            action: 'show', 
            id: process.id
        )
    }
}

class ProcessCreation implements grails.validation.Validateable {
    Long person
    Long project
}
