package ma

import grails.gorm.PagedResultList
import ma.common.adapters.web.command.Pagination
import ma.controller.FlashMessageAware
import ma.controller.PaginationAware
import ma.controller.SecurityAware
import ma.process.ProcessCreation
import ma.process.ProcessFilterService
import ma.process.UpdateProcessAttachmentCommand
import ma.security.SecurityRulesService

class ProcessController implements FlashMessageAware, SecurityAware, PaginationAware {

    static scaffold = Process

    ProcessService processService
    ProcessFilterService processFilterService
    SecurityRulesService securityRulesService

    /**
    * Shows processes of a given person and if provided
    * filtered by project
    *
    * @param person person to get the processes from
    * @param project project to filter those processes
    * @since 0.1.0
    */
    def index(Person person, Long projectId, Pagination pagination) {
        pagination = checkPagination(pagination)

        Project project = Project.get(projectId)
        PagedResultList<Process> processes = processFilterService
          .filterByProjectAndPerson(project, person, pagination.asMap())

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
            respond(
              process.errors,
              view: 'create',
              model: [
                process: process,
                person: process.person
              ]
            )
            return
        }

        processService.save(process)

        redirect(
            controller: 'process',
            action: 'show',
            id: process.id
        )
    }

  def update(Process process) {
    if (process.hasErrors()) {
      showValidationErrorMessage()
      respond(
        process.errors,
        view: 'edit',
        model: [
          process: process,
          person: process.person
        ]
      )
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
        // SECURITY CHECK
        if (!securityRulesService.isCreatedByOrAdmin(process.createdBy)) {
          notAuthorized()
          return
        }
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
        // SECURITY CHECK
        if (!securityRulesService.isCreatedByOrAdmin(process.createdBy)) {
          notAuthorized()
          return
        }

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
        // SECURITY CHECK
        if (!securityRulesService.isCreatedByOrAdmin(process.createdBy)) {
          notAuthorized()
          return
        }

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
        Process process = command.process as Process

        // SECURITY CHECK
        if (!securityRulesService.isCreatedByOrAdmin(process.createdBy)) {
          notAuthorized()
          return
        }

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
        Process process = command.process as Process

        // SECURITY CHECK
        if (!securityRulesService.isCreatedByOrAdmin(process.createdBy)) {
          notAuthorized()
          return
        }

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
        Process process = command.process as Process

        // SECURITY CHECK
        if (!securityRulesService.isCreatedByOrAdmin(process.createdBy)) {
          notAuthorized()
          return
        }

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

        // SECURITY CHECK
        if (!securityRulesService.isCreatedByOrAdmin(process.createdBy)) {
          notAuthorized()
          return
        }

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

    /**
     * Exports person's processes to CSV file
     *
     * @param person person processes are related to
     * @param project project the process belongs to
     * @since 0.3.0
     */
    def export(ExportCommand command) {
      File csvFile = processFilterService.export(command.project, command.person)
      render(file: csvFile, fileName: csvFile.name, encoding: 'UTF-8')
    }
}

class ExportCommand {
  Project project
  Person person

  static constraints = {
    project nullable: true
  }
}
