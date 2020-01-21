package ma

import ma.controller.FlashMessageAware
import ma.storage.Attachment

class PersonController implements FlashMessageAware {

  static scaffold = Person

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
}
