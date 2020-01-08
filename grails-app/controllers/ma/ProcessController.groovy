package ma

import ma.process.ProcessCreation
import ma.process.ProcessAttachmentCreation

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

        Person person = Person.get(creation.person)
        Project project = Project.get(creation.project)

        return [
            person: person,
            process: new Process(person: person, project: project)
        ]
    }

    def save(Process process) {
        if (process.hasErrors()) {
            respond(process.errors, view: 'create', model: [process: process, person: process.person])
            return
        }

        process.save()

        redirect(
            controller: 'process',
            action: 'show',
            id: process.id
        )
    }

    def edit(Process process) {
        render(view: 'edit', model: [process: process, person: process.person])
    }

    def show(Process process) {
        render(
            view: 'show',
            model: [
                person: process.person,
                process: process
            ]
        )
    }

    def attachments(Process process) {
        render(
            view: 'attachments/list',
            model: [
                process: process,
                person: process.person
            ]
        )
    }

    def addAttachment(Process process) {
        render(
            view: 'attachments/create',
            model: [
                command: new ProcessAttachmentCreation(process: process),
                person: process.person
            ]
        )
    }

    def saveAttachment(ProcessAttachmentCreation command) {
        if (command.hasErrors()) {
            respond(process.errors, view: 'create', model: [command: command, person: process.person])
            return
        }

        Process.withTransaction {
            command.process.addToAttachments(command.attachment)
            command.process.save()
        }


        redirect(
            controller: 'process',
            action: 'attachments',
            id: command.process.id
        )
    }
}
