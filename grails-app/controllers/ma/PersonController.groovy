package ma

import grails.core.GrailsApplication
import grails.gorm.PagedResultList
import ma.controller.FlashMessageAware
import ma.person.DisableCommand
import ma.person.SearchCommand

class PersonController implements FlashMessageAware {

  static scaffold = Person

  PersonService personService
  GrailsApplication grailsApplication

  def export(SearchCommand command) {
    File csvFile = personService.createSearchResultFile(command)
    render(file: csvFile, fileName: csvFile.name)
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

  def disable(DisableCommand command) {
    Person person = command.person
    personService.disable(person, command.motivation)

    showSuccessMessage('person.disable.success.description', person.fullname)
    redirect(action: 'show', id: person.id)
  }

  def enable(Person person) {
    personService.enable(person)

    showSuccessMessage('person.enable.success.description', person.fullname)
    redirect(action: 'show', id: person.id)
  }
}
