package ma

import ma.storage.Attachment

class PersonController {

  static scaffold = Person

  /**
   * Shows processes of a given person and if provided
   * filtered by project
   *
   * @param person person to get the processes from
   * @param project project to filter those processes
   * @since 0.1.0
   */
  def processes(Person person, Long projectId) {
    def processes = projectId
      ? Process.findAllByProjectAndPerson(Project.get(projectId), person)
      : Process.findAllByPerson(person)

    render(
        view: 'processes',
        model: [
            processes: processes,
            person: person,
            project: projectId ? Project.get(projectId) : null
        ]
    )
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
}
