package ma

class ProcessController {

    static scaffold = Process

    /**
    * Shows processes of a given person and if provided
    * filtered by project
    *
    * @param person person to get the processes from
    * @param project project to filter those processes
    * @since 0.1.0
    */
    def index(Person person, Long projectId) {
        def processes = projectId
            ? Process.findAllByProjectAndPerson(Project.get(projectId), person)
            : Process.findAllByPerson(person)

        render(
            view: 'index',
            model: [
                processes: processes,
                person: person,
                project: projectId ? Project.get(projectId) : null
            ]
        )
    }

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
