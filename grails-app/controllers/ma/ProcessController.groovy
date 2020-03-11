package ma

import ma.controller.FlashMessageAware
import ma.process.ProcessCreation
import ma.process.UpdateProcessAttachmentCommand

class ProcessController implements FlashMessageAware {

    static scaffold = Process

    def processService

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
            showValidationErrorMessage()
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
            showValidationErrorMessage()
            respond(process.errors, view: 'create', model: [process: process, person: process.person])
            return
        }

        processService.save(process)

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

    def delete(Process process) {
        Process.withTransaction {
            process.delete()
        }

        showSuccessMessage("process.delete.success.description")
        redirect(
            controller: 'process',
            action: 'index',
            id: process.person.id
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
                command: new ProcessAttachment(process: process),
                process: process,
                person: process.person
            ]
        )
    }

    def saveAttachment(ProcessAttachment command) {
        if (command.hasErrors()) {
            showValidationErrorMessage()
            respond(
                command.errors,
                view: 'attachments/create',
                model: [
                    command: command,
                    process: command.process,
                    person: command.process.person
                ]
            )

            return
        }

        Process.withTransaction {
            command.process.addToAttachments(command)
            command.process.save()
        }

        redirect(
            controller: 'process',
            action: 'attachments',
            id: command.process.id
        )
    }

    def editAttachment(ProcessAttachment command) {
        render(
            view: 'attachments/edit',
            model: [
                command: command,
                process: command.process,
                person: command.process.person
            ]
        )
    }

    def deleteAttachment(ProcessAttachment command) {

        ProcessAttachment.withTransaction {
            command.delete()
        }

        showSuccessMessage("attachment.delete.success.description")
        redirect(
            controller: 'process',
            action: 'attachments',
            id: command.process.id
        )
    }

    def updateAttachment(UpdateProcessAttachmentCommand command) {
        def processAttachment = ProcessAttachment.get(command.id)
        def process = processAttachment.process

        if (command.hasErrors()) {
            showValidationErrorMessage()
            respond(
                command.errors,
                view: 'attachments/edit',
                model: [
                    command: command,
                    process: process,
                    person: process.person
                ]
            )

            return
        }

        Process.withTransaction {
            if (command.attachment) {
                processAttachment.attachment = command.attachment
            }

            processAttachment.description = command.description
            processAttachment.save()
        }

        redirect(
            controller: 'process',
            action: 'attachments',
            id: process.id
        )
    }
}
