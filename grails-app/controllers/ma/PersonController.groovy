package ma

import ma.storage.Attachment

class PersonController {

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

        flash.message = "El registro de ${person.fullname} se ha borrado correctamente"

        redirect(action: 'index')
  }
}
