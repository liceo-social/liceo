package ma.process

import ma.Person
import ma.Process
import ma.Project

/**
 * Services used to filter processes
 *
 * @since 0.3.0
 */
class ProcessFilterService {

  /**
   * Filters processes by the project and person the process belongs to
   *
   * @param project project the process belongs to
   * @param person the person the process is referred to
   * @param pagination how to paginate the result list
   * @return a paginated list
   * @since 0.3.0
   */
  List<Process> filterByProjectAndPerson(Project project, Person person, Map pagination) {
    return Process.createCriteria().list(pagination) {
      if (project) {
        eq("project", project)
      }

      eq("person", person)
    }
  }
}
