package ma

import ma.authorization.AuthorizationFilterService
import ma.common.adapters.web.command.Pagination
import ma.controller.FlashMessageAware
import ma.authorization.CreateCommand
import ma.authorization.UpdateAuthorizationAttachmentCommand
import ma.controller.PaginationAware
import ma.controller.SecurityAware
import ma.security.SecurityRulesService

class AuthorizationController implements FlashMessageAware, SecurityAware, PaginationAware {

    AuthorizationFilterService authorizationFilterService
    AuthorizationService authorizationService
    SecurityRulesService securityRulesService

    /**
    * Shows processes of a given person and if provided
    * filtered by project
    *
    * @param person person to get the processes from
    * @param project project to filter those processes
    * @param pagination pagination info
    * @since 0.1.0
    */
    def index(Person person, Long projectId, Pagination pagination) {
        pagination = checkPagination(pagination)

        Project project = Project.get(projectId)
        List<Authorization> authorizations = authorizationFilterService
          .filterByProjectAndPerson(project, person, pagination.asMap())

        render(
            view: 'index',
            model: [
                authorizations: authorizations,
                person: person,
                project: projectId ? Project.get(projectId) : null
            ]
        )
    }

    /**
     * Provides enough data to show a creation form
     *
     * @param creation parameters to start creating a
     * new {@link Authorization} instance
     * @since 0.1.0
     */
    def create(CreateCommand creation) {
        if (creation.hasErrors()) {
            showValidationErrorMessage()
            render status: 404
            return
        }

        Person person = Person.get(creation.person)
        Project project = Project.get(creation.project)

        return [
            person: person,
            authorization: new Authorization(person: person, project: project)
        ]
    }

    /**
     * Saves a new instance of {@link Authorization}
     *
     * @param authorization the authorization to save
     * @since 0.1.0
     */
    def save(Authorization authorization) {
        if (authorization.hasErrors()) {
            showValidationErrorMessage()
            respond(authorization.errors, view: 'create', model: [authorization: authorization, person: authorization.person])
            return
        }

        authorizationService.save(authorization)

        redirect(
            controller: 'authorization',
            action: 'index',
            id: authorization.person.id
        )
    }

    /**
     * Updates an {@link Authorization} instance
     *
     * @since 0.1.0
     */
    def updateAuthorization(UpdateAuthorizationAttachmentCommand update) {
        if (!securityRulesService.isCreatedByOrAdmin(update.authorization.createdBy)) {
          notAuthorized()
          return
        }
        if (update.hasErrors()) {
            showValidationErrorMessage()
            respond(
                update.errors,
                view: 'update',
                model: [
                    authorization: update.authorization,
                    person: update.authorization.person
                ]
            )
            return
        }

        Authorization.withNewTransaction {
            if (update.attachment) {
                update.authorization.attachment = update.attachment
            }

            update.authorization.description = update.description
            update.authorization.save(failOnError: true, flush: true)
        }

        redirect(
            controller: 'authorization',
            action: 'index',
            id: update.authorization.person.id
        )
    }

    def delete(Authorization authorization) {
        if (!securityRulesService.isCreatedByOrAdmin(authorization.createdBy)) {
          notAuthorized()
          return
        }

        Authorization.withNewTransaction {
            authorization.delete()
        }

        showSuccessMessage("authorization.delete.success.description")
        redirect(
            controller: 'authorization',
            view: 'index',
            id: authorization.person.id
        )
    }

    def edit(Authorization authorization) {
        if (!securityRulesService.isCreatedByOrAdmin(authorization.createdBy)) {
          notAuthorized()
          return
        }

        render(view: 'edit', model: [authorization: authorization, person: authorization.person])
    }
}

