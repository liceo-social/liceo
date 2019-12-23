package ma

class PersonController {

  static scaffold = Person

  /**
   * Shows all projects of a given person
   *
   * @param person person to get the projects from
   * @since 0.1.0
   */
  def projects(Person person) {
    render(view: 'projects', model: [person: person])
  }

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
}
