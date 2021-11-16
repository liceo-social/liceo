package ma

import grails.core.GrailsApplication
import grails.gorm.PagedResultList
import ma.controller.FlashMessageAware
import ma.person.DisableCommand
import ma.person.SearchCommand
import social.liceo.controller.DeactivationService
import social.liceo.model.Deactivation
import social.liceo.common.model.Result

class PersonController implements FlashMessageAware {

  static scaffold = Person

  GrailsApplication grailsApplication

  PersonService personService
  DeactivationService deactivationService

  def export(SearchCommand command) {
    File csvFile = personService.createSearchResultFile(command)
    render(file: csvFile, fileName: csvFile.name, encoding: 'UTF-8')
  }

  def index(SearchCommand command) {
    command.max = command.max ?: grailsApplication.config.app.pagination.max
    PagedResultList<Person> result = personService.search(command)

    respond result, model:[searchCommand: command]
  }

  /**
   * Shows person's photo edit form
   *
   * @param person the person u want to change the photo of
   */
  def editPhoto(Person person) {
    render(view: 'photoEdit', model: [person: person])
  }

  /**
   * Stores the new person's photo
   *
   * @param person the person u want to change the photo of
   */
  def updatePhoto(Person person) {
    if (person.photo) {
      Person.withTransaction {
        person.save(failOnError: true, flush: true)
      }
    }

    redirect(action: 'show', params: [id: person.id])
  }

  def delete(Person person) {
        Person.withTransaction {
            Process.where {
                person == person
            }.deleteAll()

            person.delete()
        }

        showSuccessMessage("person.delete.success.description", person.fullname)
        redirect(action: 'index')
  }

  def requestDeactivation(DisableCommand command) {
    Person person = command.person
    DeactivationService.RequestParams params = DeactivationService.RequestParams.builder()
      .personId(person.id as Long)
      .motivation(command.motivation)
      .build()

    Result<Deactivation> result = deactivationService.request(params)

    if (result.hasError()) {
      showErrorMessage(result.error.code)
      redirect(action: 'show', id: person.id)
      return
    }

    showSuccessMessage('person.deactivate.requested.description', person.fullname)
    redirect(action: 'show', id: person.id)
  }

  def approveDeactivation(DisableCommand command) {
    Person person = command.person
    DeactivationService.ApprovalParams params = DeactivationService.ApprovalParams.builder()
      .personId(person.id as Long)
      .motivation(command.motivation)
      .build()

    Result<Deactivation> result = deactivationService.approve(params)

    if (result.hasError()) {
      showErrorMessage(result.error.code)
      redirect(action: 'show', id: person.id)
      return
    }

    showSuccessMessage('person.deactivate.approved.description', person.fullname)
    redirect(action: 'show', id: person.id)
  }

  def deactivate(DisableCommand command) {
    if (!command.validate()) {
      showErrorMessage("person.deactivate.error.general")
      redirect(action: 'show', id: command.person.id)
      return
    }

    Person person = command.person
    DeactivationService.DirectDeactivationParams params = DeactivationService.DirectDeactivationParams.builder()
      .personId(person.id as Long)
      .motivation(command.motivation)
      .build()

    Result<Deactivation> result = deactivationService.deactivate(params)

    if (result.hasError()) {
      showErrorMessage(result.error.message)
      redirect(action: 'show', id: person.id)
      return
    }

    showSuccessMessage('person.disable.success.description', person.fullname)
    redirect(action: 'show', id: person.id)
  }

  def activate(Person person) {
    personService.enable(person)

    showSuccessMessage('person.enable.success.description', person.fullname)
    redirect(action: 'show', id: person.id)
  }
}
